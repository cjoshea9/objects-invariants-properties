# UTILITIES
def memoized(f):
    """
    Enables memoization for functions
    """
    import functools

    # make sure we can also handle instance methods
    if hasattr(f, '__func__'):
        f = f.__func__

    # create a cache for the function
    if not hasattr(f, '_cache'):
        f._cache = {}

    #function that wraps f and handles the caching
    #@wraps makes sure this is done transparently
    @functools.wraps(f)
    def memo(g):
        key = g.graph6_string()
        if key not in f._cache:
            f._cache[key] = f(g)
        return f._cache[key]

    return memo

#GRAPH INVARIANTS

def domination_number(g):
    return g.dominating_set(value_only=True)

def min_degree(g):
    return min(g.degree())

def max_degree(g):
    return max(g.degree())

def matching_number(g):
    return int(g.matching(value_only=True, use_edge_labels=False))

def residue(g):
    seq = g.degree_sequence()

    while seq[0] > 0:
        d = seq.pop(0)
        seq[:d] = [k-1 for k in seq[:d]]
        seq.sort(reverse=True)

    return len(seq)

def annihilation_number(g):
    seq = sorted(g.degree())

    a = 0
    while sum(seq[:a+1]) <= sum(seq[a+1:]):
        a += 1

    return a

def fractional_alpha(g):
    p = MixedIntegerLinearProgram(maximization=True)
    x = p.new_variable(nonnegative=True)
    p.set_objective(sum(x[v] for v in g.vertices()))

    for v in g.vertices():
        p.add_constraint(x[v], max=1)

    for (u,v) in g.edge_iterator(labels=False):
        p.add_constraint(x[u] + x[v], max=1)

    return p.solve()

@memoized
def lovasz_theta(g):
    import cvxopt.base
    import cvxopt.solvers

    cvxopt.solvers.options['show_progress'] = False
    cvxopt.solvers.options['abstol'] = float(1e-10)
    cvxopt.solvers.options['reltol'] = float(1e-10)

    gc = g.complement()
    n = gc.order()
    m = gc.size()

    if n == 1:
        return 1.0

    #the definition of Xrow assumes that the vertices are integers from 0 to n-1, so we relabel the graph
    gc.relabel()

    d = m + n
    c = -1 * cvxopt.base.matrix([0.0]*(n-1) + [2.0]*(d-n))
    Xrow = [i*(1+n) for i in xrange(n-1)] + [b+a*n for (a, b) in gc.edge_iterator(labels=False)]
    Xcol = range(n-1) + range(d-1)[n-1:]
    X = cvxopt.base.spmatrix(1.0, Xrow, Xcol, (n*n, d-1))

    for i in xrange(n-1):
        X[n*n-1, i] = -1.0

    sol = cvxopt.solvers.sdp(c, Gs=[-X], hs=[-cvxopt.base.matrix([0.0]*(n*n-1) + [-1.0], (n,n))])
    v = 1.0 + cvxopt.base.matrix(-c, (1, d-1)) * sol['x']

    # TODO: Rounding here is a total hack, sometimes it can come in slightly
    # under the analytical answer, for example, 2.999998 instead of 3, which
    # screws up the floor() call when checking difficult graphs.
    return round(v[0], 3)

def cvetkovic(g):
    eigenvalues = g.spectrum()
    positive = 0
    negative = 0
    zero = 0
    for e in eigenvalues:
        if e > 0:
            positive += 1
        elif e < 0:
            negative += 1
        else:
            zero += 1

    return zero + min([positive, negative])

def cycle_space_dimension(g):
    return g.size()-g.order()+g.connected_components_number()

def card_center(g):
    return len(g.center())

def cycle_space_dimension(g):
    return g.size()-g.order()+g.connected_components_number()

def card_periphery(g):
    return len(g.periphery())

def max_eigenvalue(g):
    return max(g.spectrum())

def resistance_distance_matrix(g):
    L = g.laplacian_matrix()
    n = g.order()
    J = ones_matrix(n,n)
    temp = L+(1.0/n)*J
    X = temp.inverse()
    R = (1.0)*ones_matrix(n,n)
    for i in range(n):
        for j in range(n):
            R[i,j] = X[i,i] + X[j,j] - 2*X[i,j]
    return R

def kirchhoff_index(g):
    R = resistance_distance_matrix(g)
    return .5*sum(sum(R))

def largest_singular_value(g):
    A = matrix(RDF,g.adjacency_matrix())
    svd = A.SVD()
    sigma = svd[1]
    return sigma[0,0]

def independence_number(g):
    return g.independent_set(value_only=True)

def chromatic_index(g):
    if g.size() == 0:
        return 0
    import sage.graphs.graph_coloring
    return sage.graphs.graph_coloring.edge_coloring(g, value_only=True)

def card_max_cut(g):
    return g.max_cut(value_only=True)

def clique_covering_number(g):
    # Finding the chromatic number of the complement of a fullerene
    # is extremely slow, even when using MILP as the algorithm.
    # Therefore we check to see if the graph is triangle-free.
    # If it is, then the clique covering number is equal to the
    # number of vertices minus the size of a maximum matching.
    if g.is_triangle_free():
        return g.order() - matching_number(g)
    gc = g.complement()
    return gc.chromatic_number(algorithm="MILP")


efficiently_computable_invariants = [Graph.average_distance, Graph.diameter, Graph.radius, Graph.girth,  Graph.order, Graph.size, Graph.szeged_index, Graph.wiener_index, min_degree, max_degree, Graph.average_degree, matching_number, residue, annihilation_number, fractional_alpha, lovasz_theta, cvetkovic, cycle_space_dimension, card_center, card_periphery, max_eigenvalue, kirchhoff_index, largest_singular_value, Graph.vertex_connectivity, Graph.edge_connectivity]

intractable_invariants = [independence_number, domination_number, chromatic_index, Graph.clique_number, card_max_cut, clique_covering_number]

invariants = efficiently_computable_invariants + intractable_invariants

#removed Graph.treewidth as its very slow

#set precomputed values
if hasattr(Graph.treewidth.__func__, '_cache'):
    Graph.treewidth.__func__._cache[graphs.BuckyBall().graph6_string()] = 10


#GRAPH PROPERTIES




#sufficient condition for hamiltonicity
def is_dirac(g):
    n = g.order()
    deg = g.degree()
    delta=min(deg)
    if n/2 <= delta:
        return True
    else:
        return False

#sufficient condition for hamiltonicity
def is_ore(g):
    A = g.adjacency_matrix()
    D = g.degree()
    n = g.order()
    for i in range(n):
        for j in range(i):
            if A[i][j]==0:
                if D[i] + D[j] < n:
                    return False
    return True

#sufficient condition for hamiltonicity
def is_haggkvist_nicoghossian(g):
    k = g.vertex_connectivity()
    n = g.order()
    delta = min(g.degree())
    if k >= 2 and delta >= (1.0/3)*(n+k):
        return True
    else:
        return False

#sufficient condition for hamiltonicity
def is_fan(g):
    k = g.vertex_connectivity()
    if k < 2:
        return False
    D = g.degree()
    Dist = g.distance_all_pairs()
    V = g.vertices()
    n = g.order()
    for i in range(n):
        for j in range (i):
            if Dist[V[i]][V[j]]==2 and max(D[i],D[j]) < n/2.0:
                return False
    return True

#sufficient condition for hamiltonicity
def is_planar_transitive(g):
    if g.order() > 2 and g.is_planar() and g.is_vertex_transitive():
        return True
    else:
        return False

def neighbors_set(g,S):
    N = set()
    for v in S:
        for n in g.neighbors(v):
            N.add(n)
    return list(N)

#sufficient condition for hamiltonicity
def is_generalized_dirac(g):
    n = g.order()
    k = g.vertex_connectivity()
    if k < 2:
        return False
    for p in Subsets(g.vertices(),2):
        if g.is_independent_set(p):
            if len(neighbors_set(g,p)) < (2.0*n-1)/3:
                return False
    return True

#necessary condition for hamiltonicity
def is_van_den_heuvel(g):
    n = g.order()
    lc = sorted(graphs.CycleGraph(n).laplacian_matrix().eigenvalues())
    lg = sorted(g.laplacian_matrix().eigenvalues())

    for lci, lgi in zip(lc, lg):
        if lci > lgi:
            return False

    def Q(g):
        A = g.adjacency_matrix()

        D = A.parent(0)

        if A.is_sparse():
            row_sums = {}
            for (i,j), entry in A.dict().iteritems():
                row_sums[i] = row_sums.get(i, 0) + entry
            for i in range(A.nrows()):
                D[i,i] += row_sums.get(i, 0)
        else:
            row_sums=[sum(v) for v in A.rows()]
            for i in range(A.nrows()):
                D[i,i] += row_sums[i]

        return D + A

    qc = sorted(Q(graphs.CycleGraph(n)).eigenvalues())
    qg = sorted(Q(g).eigenvalues())

    for qci, qgi in zip(qc, qg):
        if qci > qgi:
            return False

    return True

#necessary condition for hamiltonicity
def is_two_connected(g):
    k = g.vertex_connectivity()
    if k < 2:
        return False
    else:
        return True

#sufficient condition for hamiltonicity
def is_lindquester(g):
    k = g.vertex_connectivity()
    if k < 2:
        return False
    D = g.distance_all_pairs()
    n = g.order()
    V = g.vertices()
    for i in range(n):
        for j in range(i):
            if D[V[i]][V[j]] == 2:
                if len(neighbors_set(g,[V[i],V[j]])) < (2*n-1)/3.0:
                    return False
    return True

def is_complete(g):
    n = g.order()
    e = g.size()
    if not g.has_multiple_edges():
        return e == n*(n-1)/2

    D = g.distance_all_pairs()
    for i in range(n):
        for j in range(i):
            if D[V[i]][V[j]] != 1:
                return False
    return True

def has_claw(g):
    return g.subgraph_search(graphs.ClawGraph(), induced=True) is not None

def is_claw_free(g):
    return not has_claw(g)

def has_perfect_matching(g):
    n = g.order()
    if n%2 == 1:
        return False
    nu = g.matching(value_only=True)
    if 2*nu == n:
        return True
    else:
        return False

#true if radius equals diameter
def has_radius_equal_diameter(g):
    return g.radius() == g.diameter()

#true if residue equals independence number
def has_residue_equals_alpha(g):
    return residue(g) == independence_number(g)

def is_not_forest(g):
    return not g.is_forest()


def bipartite_double_cover(g):
    return g.tensor_product(graphs.CompleteGraph(2))

def closed_neighborhood(g, verts):
    if isinstance(verts, list):
        neighborhood = []
        for v in verts:
            neighborhood += [v] + g.neighbors(v)
        return list(set(neighborhood))
    else:
        return [verts] + g.neighbors(verts)

#has no non-empty critical independent set (<=> the only solution to the LP independence number relaxation is all 1/2's)
def has_empty_KE_part(g):
    b = bipartite_double_cover(g)
    alpha = b.order() - b.matching(value_only=True)
    for v in g.vertices():
        test = b.copy()
        test.delete_vertices(closed_neighborhood(b,[(v,0), (v,1)]))
        alpha_test = test.order() - test.matching(value_only=True) + 2
        if alpha_test == alpha:
            return False
    return True

# Vizing's Theorem: chromatic index of any graph is either Delta or Delta+1
def is_class1(g):
    return chromatic_index(g) == max(g.degree())

def is_class2(g):
    return not(chromatic_index(g) == max(g.degree()))

def is_cubic(g):
    D = g.degree()
    return min(D) == 3 and max(D) == 3

#a property that applied to all entered hamiltonian graphs (before c60) but not the tutte graph, false for tutte graph
def is_anti_tutte(g):
    if not g.is_connected():
        return False
    return independence_number(g) <= g.diameter() + g.girth()

#a property that applied to all entered hamiltonian graphs upto c6cc6 but not the tutte graph, false for tutte graph
def is_anti_tutte2(g):
    if not g.is_connected():
        return False
    return independence_number(g) <=  domination_number(g) + g.radius()- 1

#for any graph diam <= 2*radius. this property is true in the extremal case
def diameter_equals_twice_radius(g):
    if not g.is_connected():
        return False
    return g.diameter() == 2*g.radius()

#for any graph diam >= radius. this property is true in the extremal case
def diameter_equals_radius(g):
    if not g.is_connected():
        return False
    return g.diameter() == g.radius()

def has_lovasz_theta_equals_alpha(g):
    if lovasz_theta(g) == independence_number(g):
        return True
    else:
        return False

def has_lovasz_theta_equals_cc(g):
    if lovasz_theta(g) == clique_covering_number(g):
        return True
    else:
        return False

#z1 is a triangle with pendant, that show's up in hedetniemi sufficient condition for hamiltonicity
def has_z1(g):
    return g.subgraph_search(z1, induced=True) is not None

def is_z1_free(g):
    return not has_z1(g)

#sufficient condition for hamiltonicity
def is_chvatal_erdos(g):
    return independence_number(g) <= g.vertex_connectivity()

#locally connected if the neighborhood of every vertex is connected (stronger than claw-free)
def is_locally_connected(g):
    V = g.vertices()
    for v in V:
        N = g.neighbors(v)
        if len(N) > 0:
            GN = g.subgraph(N)
            if not GN.is_connected():
                return False
    return True

#matching_covered if every edge is in a maximum matching (generalization of factor-covered which requires perfect matching)
def matching_covered(g):
    nu = matching_number(g)
    E = g.edges()
    for e in E:
        g.delete_edge(e)
        nu2 = matching_number(g)
        if nu != nu2:
            return False
        g.add_edge(e)
    return True

def localise(f):
    """
    This function takes a property (i.e., a function taking only a graph as an argument) and
    returns the local variant of that property. The local variant is True if the property is
    True for the neighbourhood of each vertex and False otherwise.
    """
    #create a local version of f
    def localised_function(g):
        return all((f(g.subgraph(g.neighbors(v))) if g.neighbors(v) else True) for v in g.vertices())

    #we set a nice name for the new function
    if hasattr(f, '__name__'):
        if f.__name__.startswith('is_'):
            localised_function.__name__ = 'is_locally' + f.__name__[2:]
        elif f.__name__.startswith('has_'):
            localised_function.__name__ = 'has_locally' + f.__name__[2:]
        else:
            localised_function.__name__ = 'localised_' + f.__name__

    return localised_function

is_locally_dirac = localise(is_dirac)
is_locally_bipartite = localise(Graph.is_bipartite)
is_locally_two_connected = localise(is_two_connected)

efficiently_computable_properties = [Graph.is_regular, Graph.is_planar, Graph.is_forest, Graph.is_eulerian, Graph.is_connected, Graph.is_clique, Graph.is_circular_planar, Graph.is_chordal, Graph.is_bipartite, Graph.is_cartesian_product, Graph.is_distance_regular,  Graph.is_even_hole_free, Graph.is_gallai_tree, Graph.is_line_graph, Graph.is_overfull, Graph.is_perfect, Graph.is_split, Graph.is_strongly_regular, Graph.is_triangle_free, Graph.is_weakly_chordal, is_dirac, is_ore, is_haggkvist_nicoghossian, is_generalized_dirac, is_van_den_heuvel, is_two_connected, is_lindquester, is_claw_free, has_perfect_matching, has_radius_equal_diameter, is_not_forest, has_empty_KE_part, is_fan, is_cubic, diameter_equals_twice_radius, has_z1, is_z1_free, diameter_equals_radius, is_locally_connected, matching_covered, is_locally_dirac, is_locally_bipartite, is_locally_two_connected]

intractable_properties = [Graph.is_hamiltonian, Graph.is_vertex_transitive, Graph.is_edge_transitive, has_residue_equals_alpha, Graph.is_odd_hole_free, Graph.is_semi_symmetric, Graph.is_line_graph, is_planar_transitive, is_class1, is_class2, is_anti_tutte, is_anti_tutte2, has_lovasz_theta_equals_cc, has_lovasz_theta_equals_alpha, is_chvatal_erdos ]

properties = efficiently_computable_properties + intractable_properties

# Graph.is_prime removed as faulty 9/2014
# built in Graph.is_transitively_reduced removed 9/2014
# is_line_graph is theoretically efficient - but Sage's implementation is not 9/2014

# weakly_chordal = weakly chordal, i.e., the graph and its complement have no induced cycle of length at least 5



#GRAPH OBJECTS


#two c4's joined at a vertex
c4c4=graphs.CycleGraph(4)
for i in [4,5,6]:
    c4c4.add_vertex()
c4c4.add_edge(3,4)
c4c4.add_edge(5,4)
c4c4.add_edge(5,6)
c4c4.add_edge(6,3)

#two c5's joined at a vertex: eulerian, not perfect, not hamiltonian
c5c5=graphs.CycleGraph(5)
for i in [5,6,7,8]:
    c5c5.add_vertex()
c5c5.add_edge(0,5)
c5c5.add_edge(0,8)
c5c5.add_edge(6,5)
c5c5.add_edge(6,7)
c5c5.add_edge(7,8)

#triangle plus pendant: not hamiltonian, not triangle-free
c3p2=graphs.CycleGraph(3)
c3p2.add_vertex()
c3p2.add_edge(0,3)

K4a=graphs.CompleteGraph(4)
K4b=graphs.CompleteGraph(4)
K4a.delete_edge(0,1)
K4b.delete_edge(0,1)
regular_non_trans = K4a.disjoint_union(K4b)
regular_non_trans.add_edge((0,0),(1,1))
regular_non_trans.add_edge((0,1),(1,0))

c6ee = graphs.CycleGraph(6)
c6ee.add_edges([(1,5), (2,4)])

#c5 plus a chord
c5chord = graphs.CycleGraph(5)
c5chord.add_edge(0,3)

#c6ee plus another chord: hamiltonian, regular, vertex transitive
c6eee = copy(c6ee)
c6eee.add_edge(0,3)

#c8 plus one long vertical chord and 3 parallel horizontal chords
c8chorded = graphs.CycleGraph(8)
c8chorded.add_edge(0,4)
c8chorded.add_edge(1,7)
c8chorded.add_edge(2,6)
c8chorded.add_edge(3,5)

#c8 plus 2 parallel chords: hamiltonian, tri-free, not vertex-transitive
c8chords = graphs.CycleGraph(8)
c8chords.add_edge(1,6)
c8chords.add_edge(2,5)


#c6ee plus another chord: hamiltonian, regular, vertex transitive
c6eee = copy(c6ee)
c6eee.add_edge(0,3)

#c8 plus one long vertical chord and 3 parallel horizontal chords
c8chorded = graphs.CycleGraph(8)
c8chorded.add_edge(0,4)
c8chorded.add_edge(1,7)
c8chorded.add_edge(2,6)
c8chorded.add_edge(3,5)

#c8 plus 2 parallel chords: hamiltonian, tri-free, not vertex-transitive
c8chords = graphs.CycleGraph(8)
c8chords.add_edge(1,6)
c8chords.add_edge(2,5)

prism = graphs.CycleGraph(6)
prism.add_edge(0,2)
prism.add_edge(3,5)
prism.add_edge(1,4)

prismsub = copy(prism)
prismsub.subdivide_edge(1,4,1)

# ham, not vertex trans, tri-free, not cartesian product
prismy = graphs.CycleGraph(8)
prismy.add_edge(2,5)
prismy.add_edge(0,3)
prismy.add_edge(4,7)

#c10 with chords, ham, tri-free, regular, planar, vertex transitive
sixfour = graphs.CycleGraph(10)
sixfour.add_edge(1,9)
sixfour.add_edge(0,2)
sixfour.add_edge(3,8)
sixfour.add_edge(4,6)
sixfour.add_edge(5,7)

#unique 24-vertex fullerene: hamiltonian, planar, not vertex transitive
c24 = Graph('WsP@H?PC?O`?@@?_?GG@??CC?G??GG?E???o??B???E???F')

#unique 26-atom fullerene: hamiltonian, planar, not vertex trans, radius=5, diam=6
c26 = Graph('YsP@H?PC?O`?@@?_?G?@??CC?G??GG?E??@_??K???W???W???H???E_')

#holton-mckay graph: hamiltonian, cubic, planar, radius=4, diameter=6
holton_mckay = Graph('WlCGKS??G?_D????_?g?DOa?C?O??G?CC?`?G??_?_?_??L')

#z1 is a graph that shows up in a sufficient condition for hamiltonicity
z1 = graphs.CycleGraph(3)
z1.add_edge(0,3)

#an example of a bipartite, 1-tough, not van_den_heuvel, not hamiltonian graph
kratsch_lehel_muller = graphs.PathGraph(12)
kratsch_lehel_muller.add_edge(0,5)
kratsch_lehel_muller.add_edge(6,11)
kratsch_lehel_muller.add_edge(4,9)
kratsch_lehel_muller.add_edge(1,10)
kratsch_lehel_muller.add_edge(2,7)

#ham, not planar, not anti_tutte
c6xc6 = graphs.CycleGraph(6).cartesian_product(graphs.CycleGraph(6))
