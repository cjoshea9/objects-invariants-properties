p3 = graphs.PathGraph(3)
p3.name(new = "p3")

k3_3=graphs.CompleteBipartiteGraph(3,3)
k3_3.name(new = "k3_3")

# The line graph of k3,3
k3_3_line_graph = k3_3.line_graph()
k3_3_line_graph.name(new = "k3_3 line graph")

k5_3=graphs.CompleteBipartiteGraph(5,3)
k5_3.name(new = "k5_3")

# independence_number(x) <= minimum(lovasz_theta(x), 2*e^sum_temperatures(x)) is false
#This is also a counterexample to independence_number(x) <= minimum(floor(lovasz_theta(x)), 2*e^sum_temperatures(x))
k1_9 = graphs.CompleteBipartiteGraph(1,9)
k1_9.name(new = "k1_9")

#two c4's joined at a vertex
c4c4=graphs.CycleGraph(4)
for i in [4,5,6]:
    c4c4.add_vertex()
c4c4.add_edge(3,4)
c4c4.add_edge(5,4)
c4c4.add_edge(5,6)
c4c4.add_edge(6,3)
c4c4.name(new="c4c4")

#two c5's joined at a vertex: eulerian, not perfect, not hamiltonian
c5c5=graphs.CycleGraph(5)
for i in [5,6,7,8]:
    c5c5.add_vertex()
c5c5.add_edge(0,5)
c5c5.add_edge(0,8)
c5c5.add_edge(6,5)
c5c5.add_edge(6,7)
c5c5.add_edge(7,8)
c5c5.name(new="c5c5")

#triangle plus pendant: not hamiltonian, not triangle-free
c3p2=graphs.CycleGraph(3)
c3p2.add_vertex()
c3p2.add_edge(0,3)
c3p2.name(new="c3p2")

K4a=graphs.CompleteGraph(4)
K4b=graphs.CompleteGraph(4)
K4a.delete_edge(0,1)
K4b.delete_edge(0,1)
regular_non_trans = K4a.disjoint_union(K4b)
regular_non_trans.add_edge((0,0),(1,1))
regular_non_trans.add_edge((0,1),(1,0))
regular_non_trans.name(new="regular_non_trans")

c6ee = graphs.CycleGraph(6)
c6ee.add_edges([(1,5), (2,4)])
c6ee.name(new="c6ee")

#c5 plus a chord
c5chord = graphs.CycleGraph(5)
c5chord.add_edge(0,3)
c5chord.name(new="c5chord")

#c6ee plus another chord: hamiltonian, regular, vertex transitive
c6eee = copy(c6ee)
c6eee.add_edge(0,3)
c6eee.name(new="c6eee")

#c8 plus one long vertical chord and 3 parallel horizontal chords
c8chorded = graphs.CycleGraph(8)
c8chorded.add_edge(0,4)
c8chorded.add_edge(1,7)
c8chorded.add_edge(2,6)
c8chorded.add_edge(3,5)
c8chorded.name(new="c8chorded")

#c8 plus 2 parallel chords: hamiltonian, tri-free, not vertex-transitive
c8chords = graphs.CycleGraph(8)
c8chords.add_edge(1,6)
c8chords.add_edge(2,5)
c8chords.name(new="c8chords")

#c8 plus 2 parallel chords: hamiltonian, tri-free, not vertex-transitive
c8chords = graphs.CycleGraph(8)
c8chords.add_edge(1,6)
c8chords.add_edge(2,5)
c8chords.name(new="c8chords")

prism = graphs.CycleGraph(6)
prism.add_edge(0,2)
prism.add_edge(3,5)
prism.add_edge(1,4)
prism.name(new="prism")

prismsub = copy(prism)
prismsub.subdivide_edge(1,4,1)
prismsub.name(new="prismsub")

# ham, not vertex trans, tri-free, not cartesian product
prismy = graphs.CycleGraph(8)
prismy.add_edge(2,5)
prismy.add_edge(0,3)
prismy.add_edge(4,7)
prismy.name(new="prismy")

#c10 with chords, ham, tri-free, regular, planar, vertex transitive
sixfour = graphs.CycleGraph(10)
sixfour.add_edge(1,9)
sixfour.add_edge(0,2)
sixfour.add_edge(3,8)
sixfour.add_edge(4,6)
sixfour.add_edge(5,7)
sixfour.name(new="sixfour")

#unique 24-vertex fullerene: hamiltonian, planar, not vertex transitive
c24 = Graph('WsP@H?PC?O`?@@?_?GG@??CC?G??GG?E???o??B???E???F')
c24.name(new="c24")

#unique 26-atom fullerene: hamiltonian, planar, not vertex trans, radius=5, diam=6
c26 = Graph('YsP@H?PC?O`?@@?_?G?@??CC?G??GG?E??@_??K???W???W???H???E_')
c26.name(new="c26")

"""
The Holton-McKay graph is the smallest planar cubic hamiltonian graph with an edge
that is not contained in a hamiltonian cycle. It has 24 vertices and the edges (0,3)
and (4,7) are not contained in a hamiltonian cycle. This graph was mentioned in
D. A. Holton and B. D. McKay, Cycles in 3-connected cubic planar graphs II, Ars
Combinatoria, 21A (1986) 107-114.

    sage: holton_mckay
    holton_mckay: Graph on 24 vertices
    sage: holton_mckay.is_planar()
    True
    sage: holton_mckay.is_regular()
    True
    sage: max(holton_mckay.degree())
    3
    sage: holton_mckay.is_hamiltonian()
    True
    sage: holton_mckay.radius()
    4
    sage: holton_mckay.diameter()
    6
"""
holton_mckay = Graph('WlCGKS??G?_D????_?g?DOa?C?O??G?CC?`?G??_?_?_??L')
holton_mckay.name(new="holton_mckay")

#z1 is a graph that shows up in a sufficient condition for hamiltonicity
z1 = graphs.CycleGraph(3)
z1.add_edge(0,3)
z1.name(new="z1")

#an example of a bipartite, 1-tough, not van_den_heuvel, not hamiltonian graph
kratsch_lehel_muller = graphs.PathGraph(12)
kratsch_lehel_muller.add_edge(0,5)
kratsch_lehel_muller.add_edge(6,11)
kratsch_lehel_muller.add_edge(4,9)
kratsch_lehel_muller.add_edge(1,10)
kratsch_lehel_muller.add_edge(2,7)
kratsch_lehel_muller.name(new="kratsch_lehel_muller")

#ham, not planar, not anti_tutte
c6xc6 = graphs.CycleGraph(6).cartesian_product(graphs.CycleGraph(6))
c6xc6.name(new="c6xc6")

#non-ham, 2-connected, eulerian (4-regular)
gould = Graph('S~dg?CB?wC_L????_?W?F??c?@gOOOGGK')
gould.name(new="gould")

#two k5s with single edge removed from each and lines joining these 4 points to a new center point, non-hamiltonian
throwing = Graph('J~wWGGB?wF_')
throwing.name(new="throwing")

#k4 plus k2 on one side, open k5 on other, meet at single point in center, non-hamiltonian
throwing2 = Graph("K~wWGKA?gB_N")
throwing2.name(new="throwing2")

#similar to throwing2 with pair of edges swapped, non-hamiltonian
throwing3 = Graph("K~wWGGB?oD_N")
throwing3.name(new="throwing3")

#graph has diameter != radius but is hamiltonian
tent = graphs.CycleGraph(4).join(Graph(1),labels="integers")
tent.name(new="tent")

#c6 with a k4 subgraph, eulerain, diameter = 3, radius=2, hamiltonian
c6subk4 = graphs.CycleGraph(6)
c6subk4.add_edge(1,5)
c6subk4.add_edge(1,4)
c6subk4.add_edge(2,5)
c6subk4.add_edge(2,4)
c6subk4.name(new="c6subk4")

#C5 with chords from one vertex to other 2 (showed up in auto search for CE's): hamiltonian
bridge = Graph("DU{")
bridge.name(new="bridge")

#nico found the smallest hamiltonian overfull graph
non_ham_over = Graph("HCQRRQo")
non_ham_over.name(new="non_ham_over")

ryan = Graph("WxEW?CB?I?_R????_?W?@?OC?AW???O?C??B???G?A?_??R")
ryan.name(new="ryan")

inp = Graph('J?`FBo{fdb?')
inp.name(new="inp")

#p10 joined to 2 points of k4, a CE to conjecture: chromatic_number<=avg degree + 1
p10k4=Graph('MhCGGC@?G?_@_B?B_')
p10k4.name(new="p10k4")

#star on 13 points with added edge: CE to alpha <+ dom + girth^2
s13e = Graph('M{aCCA?_C?O?_?_??')
s13e.name(new="s13e")

#rp CE to alpha<=2*chi+2*residue, has alpha=25,chi=2,residue=10
ryan2=graphs.CirculantGraph(50,[1,3])
ryan2.name(new="circulant_50_1_3")

#CE to alpha <= 2*girth^2+2, star with 22 rays plus extra edge
s22e = graphs.StarGraph(22)
s22e.add_edge(1,2)
s22e.name(new="s22e")

#the unique 100-atom fullerene with minimum independence number of 43 (and IPR, tetrahedral symmetry)
c100 = Graph("~?@csP@@?OC?O`?@?@_?O?A??W??_??_G?O??C??@_??C???G???G@??K???A????O???@????A????A?G??B?????_????C?G???O????@_?????_?????O?????C?G???@_?????E??????G??????G?G????C??????@???????G???????o??????@???????@????????_?_?????W???????@????????C????????G????????G?G??????E????????@_????????K?????????_????????@?@???????@?@???????@_?????????G?????????@?@????????C?C????????W??????????W??????????C??????????@?@?????????G???????????_??????????@?@??????????_???????????O???????????C?G??????????O???????????@????????????A????????????A?G??????????@_????????????W????????????@_????????????E?????????????E?????????????E?????????????B??????????????O?????????????A@?????????????G??????????????OG?????????????O??????????????GC?????????????A???????????????OG?????????????@?_?????????????B???????????????@_???????????????W???????????????@_???????????????F")
c100.name(new="c100")

dc64_g6string ="~?@?JXxwm?OJ@wESEYMMbX{VDokGxAWvH[RkTAzA_Tv@w??wF]?oE\?OAHoC_@A@g?PGM?AKOQ??ZPQ?@rgt??{mIO?NSD_AD?mC\
O?J?FG_FOOEw_FpGA[OAxa?VC?lWOAm_DM@?Mx?Y{A?XU?hwA?PM?PW@?G@sGBgl?Gi???C@_FP_O?OM?VMA_?OS?lSB??PS?`sU\
??Gx?OyF_?AKOCN`w??PA?P[J??@C?@CU_??AS?AW^G??Ak?AwVZg|?Oy_@?????d??iDu???C_?D?j_???M??[Bl_???W??oEV?\
???O??_CJNacABK?G?OAwP??b???GNPyGPCG@???"
dc64 = Graph(dc64_g6string)
dc64.name(new="dc64")

try:
    s = load(os.environ['HOME'] +'/objects-invariants-properties/dc1024_g6string.sobj')
    print "loaded graph dc1024"
    dc1024 = Graph(s)
    dc1024.name(new="dc1024")
except:
    print "couldn't load dc1024_g6string.sobj"

try:
    s = load(os.environ['HOME'] +'/objects-invariants-properties/dc2048_g6string.sobj')
    print "loaded graph dc2048"
    dc2048 = Graph(s)
    dc2048.name(new="dc2048")
except:
    print "couldn't load dc2048_g6string.sobj"

#graph from delavina's jets paper
starfish = Graph('N~~eeQoiCoM?Y?U?F??')
starfish.name(new="starfish")

#difficult graph from INP: order=11, alpha=4, best lower bound < 3
difficult11 = Graph('J?`FBo{fdb?')
difficult11.name(new="difficult11")

#c4 joined to K# at point: not KE, alpha=theta=nu=3, delting any vertex gives KE graph
c5k3=Graph('FheCG')
c5k3.name(new="c5k3")

#mycielskian of a triangle: CE to conj that chi <= max(clique, nu), chi=4, nu = clique = 3
c3mycielski = Graph('FJnV?')
c3mycielski.name(new="c3mycieski")

#4th mycielskian of a triangle, CE to conj chi <= clique + girth, chi = 7, clique = girth = 3
c3mycielski4 = Graph('~??~??GWkYF@BcuIsJWEo@s?N?@?NyB`qLepJTgRXkAkU?JPg?VB_?W[??Ku??BU_??ZW??@u???Bs???Bw???A??F~~_B}?^sB`o[MOuZErWatYUjObXkZL_QpWUJ?CsYEbO?fB_w[?A`oCM??DL_Hk??DU_Is??Al_Dk???l_@k???Ds?M_???V_?{????oB}?????o[M?????WuZ?????EUjO?????rXk?????BUJ??????EsY??????Ew[??????B`o???????xk???????FU_???????\\k????????|_????????}_????????^_?????????')
c3mycielski4.name(new="c3mycielski4")

# a PAW is a traingle with a pendant, same as a Z1
paw=Graph('C{')
paw.name(new="paw")

binary_octahedron = Graph('L]lw??B?oD_Noo')
#2 octahedrons, remove one edge from each, add vertex, connect it to deleted edge vertices
#its regular of degree 4
binary_octahedron.name(new = "binary_octahedron")

#this graph shows that the cartesian product of 2 KE graphs is not necessarily KE
# appears in Abay-Asmerom, Ghidewon, et al. "Notes on the independence number in the Cartesian product of graphs." Discussiones Mathematicae Graph Theory 31.1 (2011): 25-35.
paw_x_paw = paw.cartesian_product(paw)
paw_x_paw.name(new = "paw_x_paw")

#a KITE is a C4 with a chord
kite = Graph('Cn')
kite.name(new="kite")

#a DART is a kite with a pendant
dart = Graph('DnC')
dart.name(new="dart")

#P4 is a path on 4 vertices
p4=Graph('Ch')
p4.name(new="p4")

p5 = graphs.PathGraph(5)
p5.name(new = "p5")

"""
P29 is a CE to independence_number(x) <=degree_sum(x)/sqrt(card_negative_eigenvalues(x)) 
 and to  
<= max_degree(x)^e^card_center(x)
 and to
<= max_degree(x)^2 + card_periphery(x)
"""
p29 = graphs.PathGraph(29)
p29.name(new = "p29")

c9 = graphs.CycleGraph(9)
c9.name(new = "c9")

# CE to independence_number(x) <= (e^welsh_powell(x) - graph_rank(x))^2
c22 = graphs.CycleGraph(22)
c22.name(new = "c22")

# CE to independence_number(x) <= minimum(cvetkovic(x), 2*e^sum_temperatures(x)) 
c34 = graphs.CycleGraph(34)
c34.name(new = "c34")

ce3=Graph("Gr`HOk")
ce3.name(new = "ce3")
#ce3 is a ce to (((is_planar)&(is_regular))&(is_bipartite))->(has_residue_equals_alpha)

ce2=Graph("HdGkCA?")
#ce2 is a ce to ((is_chordal)^(is_forest))->(has_residue_equals_alpha)
ce2.name(new = "ce2")

c6 = graphs.CycleGraph(6)
c6.name(new = "c6")

ce4=Graph("G~sNp?")
ce4.name(new = "ce4")
#ce4 is a ce to ((~(is_planar))&(is_chordal))->(has_residue_equals_alpha)

ce5=Graph("X~}AHKVB{GGPGRCJ`B{GOO`C`AW`AwO`}CGOO`AHACHaCGVACG^")
ce5.name(new = "ce5")
#ce5 is a ce to: (((is_line_graph)&(is_cartesian_product))|(is_split))->(has_residue_equals_alpha)

ce6 = Graph("H??E@cN")
#ce6 is a ce to: (is_split)->((order_leq_twice_max_degree)&(is_chordal))
ce6.name(new = "ce6")

ce7 = Graph("FpGK?")
#counterexample to: (has_residue_equals_alpha)->((is_bipartite)->(order_leq_twice_max_degree))
ce7.name(new = "ce7")

ce8 = Graph('IxCGGC@_G')
#counterexample to: ((has_paw)&(is_circular_planar))->(has_residue_equals_alpha)
ce8.name(new = "ce8")

ce9 = Graph('IhCGGD?G?')
#counterexample to: ((has_H)&(is_forest))->(has_residue_equals_alpha)
ce9.name(new = "ce9")

ce10=Graph('KxkGGC@?G?o@')
#counterexample to: (((is_eulerian)&(is_planar))&(has_paw))->(has_residue_equals_alpha)
ce10.name(new = "ce10")

ce11 = Graph("E|OW")
#counterexample to: (has_alpha_residue_equal_two)->((is_perfect)|(is_regular))
ce11.name(new = "ce11")

ce12 = Graph("Edo_")
#counterexample to: (((is_cubic)&(is_triangle_free))&(is_H_free))->(has_residue_equals_two)
ce12.name(new = "ce12")

ce13 = Graph("ExOG")
#counterexample to: ((diameter_equals_twice_radius)&(is_claw_free))->(has_residue_equals_two)
ce13.name(new = "ce13")

ce14 = Graph('IhCGGC_@?')
#counterexample to: (~(matching_covered))->(has_residue_equals_alpha)
ce14.name(new = "IhCGGC_@?")

"""
CE to independence_number(x) <= 10^order_automorphism_group(x)

    sage: order(ce15)
    57
    sage: independence_number(ce15)
    25
"""
ce15 = Graph("x??C?O?????A?@_G?H??????A?C??EGo?@S?O@?O??@G???CO???CAC_??a?@G?????H???????????O?_?H??G??G??@??_??OA?OCHCO?YA????????A?O???G?O?@????OOC???_@??????MCOC???O_??[Q??@???????O??_G?P?GO@A?G_???A???A@??g???W???@CG_???`_@O??????@?O@?AGO?????C??A??F??????@C????A?E@L?????P@`??")
ce15.name(new = "ce15")

# CE to independence_number(x) <= 2*maximum(welsh_powell(x), max_even_minus_even_horizontal(x))
ce16 = Graph("mG???GP?CC?Aa?GO?o??I??c??O??G?ACCGW@????OC?G@?_A_W_OC@??@?I??O?_AC?Oo?E@_?O??I??B_?@_A@@@??O?OC?GC?CD?C___gAO?G??KOcGCiA??SC????GAVQy????CQ?cCACKC_?A?E_??g_AO@C??c??@@?pY?G?")
ce16.name(new = "ce16")

# CE to independence_number(x) >= 1/2*cvetkovic(x) 
ce17 = Graph("S??wG@@h_GWC?AHG?_gMGY_FaIOk@?C?S")
ce17.name(new = "ce17")

# CE to independence_number(x) >= matching_number - sigma_2
ce18 = Graph("cGO_?CCOB@O?oC?sTDSOCC@O???W??H?b???hO???A@CCKB??I??O??AO@CGA???CI?S?OGG?ACgQa_Cw^GP@AID?Gh??ogD_??dR[?AG?")
ce18.name(new = "ce18")

# CE to independence_number(x) <= maximum(max_even_minus_even_horizontal(x), radius(x)*welsh_powell(x))
ce19 = Graph('J?@OOGCgO{_')
ce19.name(new = "ce19")

# CE to independence_number(x) <= card_center(x) + max_even_minus_even_horizontal(x) + 1
ce20 = Graph('M?CO?k?OWEQO_O]c_')
ce20.name(new = "ce20")

# CE to independence_number(x) <= median_degree(x)^2 + card_periphery(x)
ce21 = Graph('FiQ?_')
ce21.name(new = "ce21")

# CE to independence_number(x) <= brinkmann_steffen(x) + max_even_minus_even_horizontal(x) + 1
ce22 = Graph('Ss?fB_DYUg?gokTEAHC@ECSMQI?OO?GD?')
ce22.name(new = "ce22")

# CE to independence_number(x) <= inverse_degree(x) + order_automorphism_group(x) + 1
ce23 = Graph("HkIU|eA")
ce23.name(new = "ce23")

# CE to independence_number(x) <= ceil(eulerian_faces(x)/diameter(x)) +max_even_minus_even_horizontal(x)
ce24 = Graph('JCbcA?@@AG?')
ce24.name(new = "ce24")

# CE to independence_number(x) <= floor(e^(maximum(max_even_minus_even_horizontal(x), fiedler(x))))
ce25 = Graph('OX??ZHEDxLvId_rgaC@SA')
ce25.name(new = "ce25")

# CE to independence_number(x) <= maximum(card_periphery(x), radius(x)*welsh_powell(x))
ce26 = Graph("NF?_?o@?Oa?BC_?OOaO")
ce26.name(new = "ce26")

# CE to independence_number(x) <= floor(average_distance(x)) + maximum(max_even_minus_even_horizontal(x), brinkmann_steffen(x))
ce27 = Graph("K_GBXS`ysCE_")
ce27.name(new = "ce27")

# CE to independence_number(x) <= minimum(annihilation_number(x), 2*e^sum_temperatures(x))
ce28 = Graph("g??O?C_?`?@?O??A?A????????C?????G?????????A@aA??_???G??GA?@????????_???GHC???CG?_???@??_??OB?C?_??????_???G???C?O?????O??A??????G??")
ce28.name(new = "ce28")

# CE to independence_number(x) <= maximum(2*welsh_powell(x), maximum(max_even_minus_even_horizontal(x), laplacian_energy(x)))
ce29 = Graph("P@g??BSCcIA???COcSO@@O@c")
ce29.name(new = "ce29")

# CE to independence_number(x) <= maximum(order_automorphism_group(x), 2*cvetkovic(x) - matching_number(x))
ce30 = Graph("G~q|{W")
ce30.name(new = "ce30")

# CE to independence_number(x) <= max_even_minus_even_horizontal(x) + min_degree(x) + welsh_powell(x)
ce31 = Graph("VP??oq_?PDOGhAwS??bSS_nOo?OHBqPi?I@AGP?POAi?")
ce31.name(new = "ce31")

# CE to independence_number(x) >= order(x)/szekeres_wilf(x)
ce32 = Graph('H?`@Cbg')
ce32.name(new = "ce32")

# CE to independence_number(x) <= max_even_minus_even_horizontal(x) + minimum(card_positive_eigenvalues(x), card_center(x) + 1)
ce33 = Graph("O_aHgP_kVSGOCXAiODcA_")
ce33.name(new = "ce33")

# CE to independence_number(x) <= card_center(x) + maximum(diameter(x), card_periphery(x))
ce34 = Graph('H?PA_F_')
ce34.name(new = "ce34")
 
# CE to independence_number(x) <= card_center(x) + maximum(diameter(x), card_periphery(x))ce35 = Graph("")
ce35 = Graph("HD`cgGO")
ce35.name(new = "ce35")

# CE to independence_number(x) >= max_degree(x) - order_automorphism_group(x)
ce36 = Graph('ETzw')
ce36.name(new = "ce36")

# CE to independence_number(x) <= maximum(card_center(x), diameter(x)*max_degree(x)) 
ce37 = Graph("~?AA?G?????@@??@?A???????????O??????????G_?A???????????????A?AO?????????G???G?@???@???O?????????????C???????_???????C?_?W???C????????_??????????????????_???????_???O????????D??????????C????????GCC???A??G??????A@??A??@G???_?????@_??????_??G???K??????A????C??????????A???_?A????`??C_O????G????????????A?G???????????????????O?????C??????@???__?@O_G??C????????OA?????????????????????????GA_GA????O???_??O??O?G??G?_C???@?G???O???_?O???_??????C???????????????E_???????????????_@???O??????CC???O?????????OC_????_A????????_?G??????O??????_??????_?I?O??????A???????O?G?O???C@????????????_@????C?????@@???????C???O??A?????_??????A_??????????A?G????AB???A??C?G??????????G???A??@?A???????@???????D?_????B????????????????????g?C???C????G????????@??????@??A????????@????_??_???o?????????@????????????_???????A??????C????A?????C????O????@?@???@?A_????????CA????????????????H???????????????????O????_??OG??Ec?????O??A??_???_???O?C??`?_@??@??????O????G????????????A????@???_?????????_?A???AAG???O????????????????????C???_???@????????????_??H???A??W?O@????@_???O?_A??O????OG???????G?@??G?C?????G?????????@?????????G?O?????G???????_?????????@????@?????????G????????????C?G?????????_C?@?A????G??GA@????????????@?????C??G??????_?????????_@?????@???A?????@?????????????????CG??????_?????@???????@C???O????_`?????OA?G??????????????Q?A?????????????A????@C?????GO??_?C???????O???????@?G?A????O??G???_????_?????A?G_?C?????????C?")
ce37.name(new = "ce37")

# CE to independence_number(x) <= abs(-card_center(x) + min_degree(x)) + max_even_minus_even_horizontal(x)
ce38 = Graph('FVS_O')
ce38.name(new = "ce38")

# CE to independence_number(x) <= abs(-card_center(x) + max_degree(x)) + max_even_minus_even_horizontal(x)
ce39 = Graph("FBAuo")
ce39.name(new = "ce39") 

# CE to independence_number(x) <= floor(inverse_degree(x)) + order_automorphism_group(x) + 1
ce40 = Graph('Htji~Ei')
ce40.name(new = "ce40")

# CE to independence_number(x) <= maximum(girth(x), card_center(x) + card_periphery(x)) 
ce41 = Graph("FhX?G")
ce41.name(new = "ce41")

# CE to independence_number(x) <= card_center(x) + maximum(residue(x), card_periphery(x))
ce42 = Graph('GP[KGC')
ce42.name(new = "ce42") 

# CE to independence_number(x) <= maximum(girth(x), (barrus_bound(x) - order_automorphism_group(x))^2) 
ce43 = Graph("Exi?")
ce43.name(new = "ce43")

# CE to independence_number(x) <= (brinkmann_steffen(x) - szekeres_wilf(x))^2 + max_even_minus_even_horizontal(x)
ce44 = Graph('GGDSsg')
ce44.name(new = "ce44")

# CE to independence_number(x) <= maximum(max_even_minus_even_horizontal(x), radius(x)*szekeres_wilf(x)) 
ce45 = Graph("FWKH?")
ce45.name(new = "ce45")

# CE to independence_number(x) <= maximum(card_periphery(x), radius(x)*szekeres_wilf(x))
ce46 = Graph('F`I`?')
ce46.name(new = "ce46")

# CE to independence_number(x) <= maximum(card_periphery(x), diameter(x) + inverse_degree(x)) 
ce47 = Graph("KVOzWAxewcaE")
ce47.name(new = "ce47")

# CE to independence_number(x) <= maximum(card_periphery(x), max_even_minus_even_horizontal(x) + min_degree(x))
ce48 = Graph('Iq]ED@_s?')
ce48.name(new = "ce48")

# CE to independence_number(x) >= sqrt(card_positive_eigenvalues(x)) 
ce49 = Graph("K^~lmrvv{~~Z")
ce49.name(new = "ce49")

# CE to  independence_number(x) <= max_degree(x) + maximum(max_even_minus_even_horizontal(x), sigma_2(x))
ce50 = Graph('bCaJf?A_??GY_O?KEGA???OMP@PG???G?CO@OOWO@@m?a?WPWI?G_A_?C`OIG?EDAIQ?PG???A_A?C??CC@_G?GDI]CYG??GA_A??')
ce50.name(new = "ce50")

# CE to independence_number(x) >= matching_number(x) - order_automorphism_group(x) - 1 
ce51 = Graph("Ivq~j^~vw")
ce51.name(new = "ce51")

# CE to independence_number(x) >= order(x)/szekeres_wilf(x)
ce52 = Graph('H?QaOiG')
ce52.name(new = "ce52")

# CE to independence_number(x) >= matching_number(x) - sigma_2(x) - 1 
ce53 = Graph("]?GEPCGg]S?`@??_EM@OTp?@E_gm?GW_og?pWO?_??GQ?A?^HIRwH?Y?__BC?G?[PD@Gs[O?GW")
ce53.name(new = "ce53")

# CE to independence_number(x) >= -average_distance(x) + ceil(lovasz_theta(x))
ce54 = Graph('lckMIWzcWDsSQ_xTlFX?AoCbEC?f^xwGHOA_q?m`PDDvicEWP`qA@``?OEySJX_SQHPc_H@RMGiM}`CiG?HCsm_JO?QhI`?ARLAcdBAaOh_QMG?`D_o_FvQgHGHD?sKLEAR^ASOW~uAUQcA?SoD?_@wECSKEc?GCX@`DkC')
ce54.name(new = "ce54")

# CE to independence_number(x) >= -card_periphery(x) + matching_number(x) 
ce55 = Graph("I~~~~~~zw")
ce55.name(new = "ce55")

# CE to independence_number(x) >= lovasz_theta(x)/edge_con(x)
ce56 = Graph('HsaGpOe')
ce56.name(new = "ce56")

# CE to independence_number(x) >= minimum(max_degree(x), floor(lovasz_theta(x))) 
ce57 = Graph("^?H{BDHqHosG??OkHOhE??B[CInU?@j_A?CoA^azGPLcb_@GEYYRPgG?K@gdPAg?d@_?_sGcED`@``O")
ce57.name(new = "ce57")

# CE to independence_number>= barrus_bound(x) - max(card_center(x), card_positive_eigenvalues(x))
ce58 = Graph('Sj[{Eb~on~nls~NJWLVz~~^|{l]b\uFss')
ce58.name(new = "ce58")

# CE to independence_number(x) >= floor(tan(barrus_bound(x) - 1))
ce59 = Graph("RxCWGCB?G?_B?@??_?N??F??B_??w?")
ce59.name(new = "ce59")

# CE to independence_number(x) >= -1/2*diameter(x) + lovasz_theta(x)
ce60 = Graph('wSh[?GCfclJm?hmgA^We?Q_KIXbf\@SgDNxpwHTQIsIB?MIDZukArBAeXE`vqDLbHCwf{fD?bKSVLklQHspD`Lo@cQlEBFSheAH?yW\YOCeaqmOfsZ?rmOSM?}HwPCIAYLdFx?o[B?]ZYb~IK~Z`ol~Ux[B]tYUE`_gnVyHRQ?{cXG?k\BL?vVGGtCufY@JIQYjByg?Q?Qb`SKM`@[BVCKDcMxF|ADGGMBW`ANV_IKw??DRkY\KOCW??P_?ExJDSAg')
ce60.name(new = "ce60")

# CE to independence_number(x) <= maximum(card_negative_eigenvalues(x), max_common_neighbors(x) + max_even_minus_even_horizontal(x))
ce61 = Graph("KsaAA?OOC??C")
ce61.name(new = "ce61")
 
# CE to independence_number(x) >= minimum(floor(lovasz_theta(x)), tan(spanning_trees_count(x)))
ce62 = Graph("qWGh???BLQcAH`aBAGCScC@SoBAAFYAG?_T@@WOEBgRC`oSE`SG@IoRCK[_K@QaQq?c@?__G}ScHO{EcCa?K?o?E?@?C[F_@GpV?K_?_?CSW@D_OCr?b_XOag??C@gGOGh??QFoS?@OHDAKWIX_OBbHGOl??\Cb@?E`WehiP@IGAFC`GaCgC?JjQ???AGJgDJAGsdcqEA_a_q?")
ce62.name(new = "ce62")

# CE to independence_number(x) >= diameter(x)/different_degrees(x) 
ce63 = Graph("KOGkYBOCOAi@")
ce63.name(new = "ce63")

# CE to independence_number(x) >= -max_common_neighbors(x) + min_degree(x)
ce64 = Graph('`szvym|h~RMQLTNNiZzsgQynDR\p~~rTZXi~n`kVvKolVJfP}TVEN}Thj~tv^KJ}D~VqqsNy|NY|ybklZLnz~TfyG')
ce64.name(new = "ce64")

# CE to independence_number(x) >= -10^different_degrees(x) + matching_number(x) 
ce65 = Graph("W~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
ce65.name(new = "ce65")

# CE to independence_number(x) >= girth^max_degree+1
ce66 = Graph("~?@EG??????????@G????_???a???C????????@???A???????G??????C?GCG????????A???C@??????@????O??A??C?????_??O???CA???c??_?_?@????A????@??????C???C?G?O?C???G?????????O?_G?C????G??????_?????@??G???C??????O?GA?????O???@????????A?G?????????_C???????@??G??@??_??IA@???????G?@??????@??_?@????C??G???_????O???P???@???o??????O?????S?O???A???G?????c_?????D?????A???A?????G@???????O???H????O????@@????@K????????C??C?????G??")
ce66.name(new = "ce66")

# CE to independence_number(x) <= maximum(cycle_space_dimension(x), floor(lovasz_theta(x))) 
ce67 = Graph("G??EDw")
ce67.name(new = "ce67")

# CE to independence_number(x) >= minimum(card_positive_eigenvalues(x), 2*card_zero_eigenvalues(x))
ce68 = Graph('HzzP|~]')
ce68.name(new = "ce68")

# CE to independence_number(x) <= maximum(max_degree(x), radius(x)^card_periphery(x)) 
ce69 = Graph("F?BvO")
ce69.name(new = "ce69")

# CE to independence_number(x) >= floor(lovasz_theta(x))/vertex_con(x)
ce70 = Graph('~?@Z??????O?M??`S??A?`?A?????@????`?????A?A?????A@????GO?@@??A_????????O_???I@_??G??A?`?C????????@???????????@??C?@?????O??@??CA??A?D??G?_?????_Q@G????C?_?A??@???O????G?O?G?_?????CoG?G???X??C???_CAG_C??????G?????@?Ao?????C???A??????_??SG??cOC??????????Ao????????_?????G???????D?????C??_?B?????a??_???????G?@?????C??????C?c?????G_?_??G??_Q????C????B?_CG????AGC???G?O??_I????@??????_??a??@?O_G??O??aA@@?????EA???@???????@???????O?O??@??`_G???????GCA?_GO????_?_????????????_??I?@?C???@????????G?aG??????W????@PO@???oC?CO???_??G?@@?CO??K???C@??O???@????D?????A?@G?G?O???_???????Ao??AC???G?_???G????????A??????_?p???W?A?Ao@?????_?????GA??????????????_?C??????@O????_@??O@Gc@??????????A_??????')
ce70.name(new = "ce70")

# CE to independence_number(x) <= maximum(matching_number(x), critical_independence_number(x))
ce71 = Graph('ECYW')
ce71.name(new = "ce71")

# CE to independence_number(x)>=-1/2*x.diameter() + x.lovasz_theta()
ce72 = Graph('fdSYkICGVs_m_TPs`Fmj_|pGhC@@_[@xWawsgEDe_@g`TC{P@pqGoocqOw?HBDS[R?CdG\e@kMCcgqr?G`NHGXgYpVGCoJdOKBJQAsG|ICE_BeMQGOwKqSd\W?CRg')
ce72.name(new = "ce72")

# CE to independence_number(x) >= minimum(floor(lovasz_theta(x)), max_even_minus_even_horizontal(x) + 1)
ce73 = Graph('h???_?CA?A?@AA????OPGoC@????A@?A?_C?C?C_A_???_??_G????HG????c?G_?G??HC??A@GO?G?A@A???_@G_?_G_GC_??E?O?O`??@C?@???O@?AOC?G?H??O?P??C_?O_@??')
ce73.name(new = "ce73")

# CE to independence_number(x) >= minimum(diameter(x), lovasz_theta(x))
ce74 = Graph("FCQb_")
ce74.name(new = "ce74")

# CE to independence_number(x) >= minimum(girth(x), floor(lovasz_theta(x)))
ce75 = Graph('E?Bw')
ce75.name(new = "ce75")

# CE to independence_number(x) <= maximum(average_distance(x), max_even_minus_even_horizontal(x))*sum_temperatures(x)
ce76 = Graph("~?@DS?G???G_?A_?OA?GC??oa?A@?@?K???L?_?S_??CCSA_g???@D?????_?A??EO??GAOO_@C`???O?_CK_???_o_?@O??XA???AS???oE`?A?@?CAa?????C?G??i???C@qo?G?Og?_O?_?@???_G????o?A_@_?O?@??EcA???__?@GgO?O@oG?C?@??CIO?_??G??S?A?@oG_K?@C??@??QOA?C????AOo?p?G???oACAOAC@???OG??qC???C??AC_G?@??GCHG?AC@?_@O?CK?@?B???AI??OO_S_a_O??????AO?OHG?@?????_???EGOG??@?EF@?C?Pc?????C?W_PA?O@?_?@A@??OD_C?@?@?A??CC?_?i@?K?_O_CG??A?")
ce76.name(new = "ce76")

# CE to independence_number(x) <= maximum(matching_number(x), critical_independence_number(x)) 
ce77 = Graph("iF\ZccMAoW`Po_E_?qCP?Ag?OGGOGOS?GOH??oAAS??@CG?AA?@@_??_P??G?SO?AGA??M????SA????I?G?I???Oe?????OO???_S?A??A????ECA??C?A@??O??S?@????_@?_??S???O??")
ce77.name(new = "ce77")

# CE to independence_number(x) <= maximum(max_degree(x), radius(x)^card_periphery(x))
ce78 = Graph("G_aCp[")
ce78.name(new = "ce78")

# CE to independence_number(x) <= residue(x)^2
ce79 = Graph('J?B|~fpwsw_')
ce79.name(new = "ce79")

# CE to independence_number(x) <= 10^(card_center(x)*log(10)/log(sigma_2(x)))
ce80 = Graph('T?????????????????F~~~v}~|zn}ztn}zt^')
ce80.name(new = "ce80")

# CE to independence_number(x) <= diameter(x)^card_periphery(x)
ce81 = Graph('P?????????^~v~V~rzyZ~du{')
ce81.name(new = "ce81")

# CE to independence_number(x) <= radius(x)*residue(x) + girth(x)
ce82 = Graph('O????B~~^Zx^wnc~ENqxY')
ce82.name(new = "ce82")

# CE to independence_number(x) <= minimum(lovasz_theta(x), residue(x)^2)
#independence_number(x) <= minimum(annihilation_number(x), residue(x)^2)
#independence_number(x) <= minimum(fractional_alpha(x), residue(x)^2)
#independence_number(x) <= minimum(cvetkovic(x), residue(x)^2)
#independence_number(x) <= minimum(residue(x)^2, floor(lovasz_theta(x)))
#independence_number(x) <= minimum(size(x), residue(x)^2)
ce83 = Graph('LEYSrG|mrQ[ppi')
ce83.name(new = "ce83")

# CE to independence_number(x) <= maximum(laplacian_energy(x), brinkmann_steffen(x)^2)
ce84 = Graph('~?@r?A??OA?C??????@?A????CC?_?A@????A?@???@?S?O????AO??????G???????C????????C?C???G?????_??????_?G?????O?A?_?O?O@??O???T@@??????O????C_???C?CO???@??@?@???_???O??O??A??O???O?A?OB?C?AD???C`?B?__?_????????Q?C??????????????_???C??_???A?gO??@C???C?EC?O??GG`?O?_?_??O????_?@?GA?_????????????G????????????????????AO_?C?????????P?IO??I??OC???O????A??AC@AO?o????????o@??O?aI?????????_A??O??G??o?????????_??@?????A?O?O?????G?????H???_????????A??a?O@O?_?D???????O@?????G???GG?CA??@?A@?A????GA?@???G??O??A??????AA???????O??_c??@???A?????_????@CG????????????A???A???????A?W???B????@?????HGO???????_@_?????C??????????_a??????_???????@G?@O?@@_??G@???????GG?O??A??????@????_??O_?_??CC?B???O??@????W??`AA????O??_?????????????????_???A??????@G??????I@C?G????????A@?@@?????C???p???????????????????G?_G????Z?A????_??????G????Q????@????????_@O????@???_QC?A??@???o???G???@???????O???CC??O?D?O?@C????@O?G?????A??@C???@????O?????????_??C??????_?@????O??????O?Y?C???_?????A??@OoG???????A???G??????CC??A?A?????????????????GA_???o???G??O??C???_@@??????@?????G??????????O???@O???????????A????S??_o????????A??B??????_??C????C?')
ce84.name(new = "ce84")

# CE to independence_number(x) <= girth(x)^ceil(laplacian_energy(x))
ce85 = Graph('bd_OPG_J_G?apBB?CPk@`X?hB_?QKEo_op`C?|Gc?K_?P@GCoGPTcGCh?CBIlqf_GQ]C_?@jlFP?KSEALWGi?bIS?PjO@?CCA?OG?')
ce85.name(new = "ce85")

# CE to independence_number(x) <= diameter(x)*residue(x) + different_degrees(x)
ce86 = Graph('SK|KWYc|^BJKlaCnMH^ECUoSC[{LHxfMG')
ce86.name(new = "ce86")

# CE to independence_number(x) <= maximum(max_common_neighbors(x), girth(x)^laplacian_energy(x))
ce87 = Graph('~?@iA?B@@b?[a??oHh_gC?@AGD?Wa???_E@_@o_AkGA@_o?_h??GG??cO??g?_?SD?d@IW?s?P_@@cSG?_B??d?CSI?OCQOH_?bo?CAaC???pGC@DO@?PHQOpO??A?_A@K[PC@?__???@OSCOGLO?oOAAA?IOX@??GC?O?P??oA_?KPIK?Q@A?sQC???LA???aQOC_AeG?Q?K_Oo?AB?OU?COD?VoQ?@D????A?_D?CAa?@@G?C??CGHcCA_cB?@c@_O?H??_@?@OWGGCo??AGC??AQ?QOc???Ow_?C[?O@@G_QH?H?O???_I@@PO????FAGk??C?ka@D@I?P?CooC@_O@?agAE??CpG?AA_`OO??_?Q?AiOQEK?GhB@CAOG?G?CC??C@O@GdC__?OIBKO?aOD_?OG???GACH@?b?@?B_???WPA?@_?o?XQQ?ZI_@?O_o_?@O??EDGOBEA??_aOSQsCO@?_DD`O??D?JaoP?G?AOQOCAS?k??S?c@?XW?QCO??_OAGOWc__G?_??G??L@OP?b?O?GCCMAH????????@@?A?C@oDaGG?Wk@H@OM?_A?IOu`SG?E@??W?I@EQA@@_@Wa?@?_??C??AAAiGQG@@?`@oA?_??OgC?K_G??G`?@S@B?A?HWc?HG??`gO???A?W?A?O?MpS??D?GS?GDC_??I@??IPAOdk`?CG??A?pPAgIDlCYCTSDgg?@FW?DI?O_OW?_S??AAQB_OOCF????XS_?@l_kAw__Ea?O?C_CGO??EG??WLb@_H??OCaAET@S?@?I???_??LaO_HCYG@G_G?_?_C???os?_G?OO@s_??_?_GGE`Os??_GCa?DWO?A@?@_CB`MOBCGIC???GKA_c?@BSh??@?RC[?eg?@hOC?_?BeGOaC?AWOSCm@G?A??A?G?Ga_')
ce87.name(new = "ce87")

# CE to independence_number(x) <= maximum(radius(x), max_degree(x))^2
ce88 = Graph('h@`CA???GH?AAG?OW@@????E???O?O???PO?O?_?G??`?O_???@??E?E??O??A?S@???S???????U?GAI???A?DA??C?C@??PA?A???_C_?H?AA??_C??DCO?C???_?AAG??@O?_?G')
ce88.name(new = "ce88")

# CE to independence_number(x) <= max_degree(x) + maximum(max_even_minus_even_horizontal(x), geometric_length_of_degree_sequence(x))
ce89 = Graph("_qH?S@??`??GG??O?_?C?_??@??@??G??C??_??C????O??G???@????O???A???@????C???C?????G????")
ce89.name(new = "ce89")

# CE to independence_number(x) >= floor(arccosh(lovasz_theta(x)))^2 
ce90 = Graph("~?@Td|wi\\fbna~}wepkkbXcrW}\\~NvtLKpY\\J_Ub^~yM~^tHnM}jPffKkqnijvxD@xa{UOzzvr?L^PFi||yt@OQ\YU{Vh]tWzwzpj\\n|kR]`Y}RpCvxk{rEMRP\\}|}dNdNtbO~yrkgMxlOXr|FvQ{tvfKKnHrp^}jV\\B^n\\LvLZeyX}QSKN^sm~yl\\[NJZXqdk]O|^zHl~vC{w`Nsn}x]utqrJozKXV|eIUUPv~ydc}]xJNWZjW|lpYm}{Jf~JWMixb^t]e|S~B[vKc{K[Kjut~}Kj~iAl\\tVNgyZadvoA}rdTlr\\\\wNr^^kJzrp|qlVy]siKncI~`oNm|ul\\PxDRyzddDzrjUn~ciOgbR}p~Cz|~MlxYoEVnVuZkxJgvmtE]]}~PRp[He]oBQz]PVJ~gVnvSUR|QF|`lomFh[j|jIaS~vh~_rYiiK}FnEW}ovnntxtRFBakzvwn[biJhNvf|VDV?m~Y]ndmfJQ|M@QvnNf~MCyn~{HSU~fvEv~@}u|spOXzTVNY\\kjDNt\\zRMXxU|g|XrzFzDYiVvho}bQbyfI{{w[_~nrm}J~LhwH}TNmfM^}jqajl_ChY]M}unRK\\~ku")
ce90.name(new = "ce90")

# CE to independence_number(x) <= maximum(2*welsh_powell(x), max_even_minus_even_horizontal(x)^2)  
ce91 = Graph("q?}x{k\FGNCRacDO`_gWKAq?ED?Qc?IS?Da?@_E?WO_@GOG@B@?Cc?@@OW???qO?@CC@?CA@C?E@?O?KK???E??GC?CO?CGGI??@?cGO??HG??@??G?SC???AGCO?KAG???@O_O???K?GG????WCG??C?C??_C????q??@D??AO???S????CA?a??A?G??IOO????B?A???_??")
ce91.name(new = "ce91")

# CE to independence_number(x) >= -max_common_neighbors(x) + min_degree(x) - 1
ce92 = Graph("qR}fexr{J\\innanomndYrzmy^p~Ri]c]lA{~jVurv]n~reCed~|j{TtvnMtB~nZFrz{wUnV^fzV\\rUlt|qvJubnFwWSxxzfZ}Btj`yV~rv\\nknwl~Z?T]{qwn~bFzh^\\{Ezv}p~I^RV|oXe~knL~x^nNtvYlrezLX^tj{S^Rflqqv]e|S^}vpbe~Ni]m]}zfbZolnPl{N~}]X?")
ce92.name(new = "ce92")

#a K5 with a pendant, CE to dirac => regular or planar conjecture
k5pendant = Graph('E~}?')
k5pendant.name(new="k5pendant")

#same as H
killer = Graph('EgSG')
killer.name(new="killer")

#alon_seymour graph: CE to the rank-coloring conjecture, 56-regular, vertex_trans, alpha=2, omega=22, chi=chi'=edge_connect=56
alon_seymour=Graph([[0..63], lambda x,y : operator.xor(x,y) not in (0,1,2,4,8,16,32,63)])
alon_seymour.name(new="alon_seymour")

k3 = graphs.CompleteGraph(3)
k3.name(new="k3")

k4 = graphs.CompleteGraph(4)
k4.name(new="k4")

k5 = graphs.CompleteGraph(5)
k5.name(new="k5")

k6 = graphs.CompleteGraph(6)
k6.name(new="k6")

# CE to independence_number(x) >= floor(tan(floor(gutman_energy(x))))
k37 = graphs.CompleteGraph(37)
k37.name(new = "k37")

c4 = graphs.CycleGraph(4)
c4.name(new="c4")

# CE to independence_number(x) <= residue(x)^(degree_sum(x)^density(x))
c102 = graphs.CycleGraph(102)
c102.name(new = "c102")

p2 = graphs.PathGraph(2)
p2.name(new="p2")

p6 = graphs.PathGraph(6)
p6.name(new="p6")

"""
CE to independence_number(x) <= e^(cosh(max_degree(x) - 1))
 and to
independence_number(x) <= max_degree(x)*min_degree(x) + card_periphery(x)
"""
p9 = graphs.PathGraph(9)
p9.name(new = "p9")

# CE to independence_number(x) <= 2*cvetkovic(x)*log(10)/log(x.size())
p102 = graphs.PathGraph(102)
p102.name(new = "p102")

#star with 3 rays, order = 4
k1_3 = graphs.StarGraph(3)
k1_3.name(new="k1_3")

k10 = graphs.CompleteGraph(10)
k10.name(new="k10")

c60 = graphs.BuckyBall()
c60.name(new="c60")

#moser spindle
moser = Graph('Fhfco')
moser.name(new = "moser")

#Holt graph is smallest graph which is edge-transitive but not arc-transitive
holt = graphs.HoltGraph()
holt.name(new = "holt")

golomb = Graph("I?C]dPcww")
golomb.name(new = "golomb")

edge_critical_5=graphs.CycleGraph(5)
edge_critical_5.add_edge(0,3)
edge_critical_5.add_edge(1,4)
edge_critical_5.name(new="edge_critical_5")

#a CE to alpha >= min{e-n+1,diameter}
heather = graphs.CompleteGraph(4)
heather.add_vertex()
heather.add_vertex()
heather.add_edge(0,4)
heather.add_edge(5,4)
heather.name(new="heather")

pete = graphs.PetersenGraph()

#residue = alpha = 3, a CE to conjecture that residue=alpha => is_ore
ryan3=graphs.CycleGraph(15)
for i in range(15):
    for j in [1,2,3]:
        ryan3.add_edge(i,(i+j)%15)
        ryan3.add_edge(i,(i-j)%15)
ryan3.name(new="ryan3")

#sylvester graph: 3-reg, 3 bridges, no perfect matching (why Petersen theorem requires no more than 2 bridges)
sylvester = Graph('Olw?GCD@o??@?@?A_@o`A')
sylvester.name(new="sylvester")

fork=graphs.PathGraph(4)
fork.add_vertex()
fork.add_edge(1,4)
fork.name(new="fork")

#one of the 2 order 11 chromatic edge-critical graphs discovered by brinkmann and steffen
edge_critical_11_1 = graphs.CycleGraph(11)
edge_critical_11_1.add_edge(0,2)
edge_critical_11_1.add_edge(1,6)
edge_critical_11_1.add_edge(3,8)
edge_critical_11_1.add_edge(5,9)
edge_critical_11_1.name(new="edge_critical_11_1")

#one of the 2 order 11 chromatic edge-critical graphs discovered by brinkmann and steffen
edge_critical_11_2 = graphs.CycleGraph(11)
edge_critical_11_2.add_edge(0,2)
edge_critical_11_2.add_edge(3,7)
edge_critical_11_2.add_edge(6,10)
edge_critical_11_2.add_edge(4,9)
edge_critical_11_2.name(new="edge_critical_11_2")

#chromatic_index_critical but not overfull
pete_minus=graphs.PetersenGraph()
pete_minus.delete_vertex(9)
pete_minus.name(new="pete_minus")

bow_tie = Graph(5)
bow_tie.add_edge(0,1)
bow_tie.add_edge(0,2)
bow_tie.add_edge(0,3)
bow_tie.add_edge(0,4)
bow_tie.add_edge(1,2)
bow_tie.add_edge(3,4)
bow_tie.name(new = "bow_tie")



"""
The Haemers graph was considered by Haemers who showed that alpha(G)=theta(G)<vartheta(G).
The graph is a 108-regular graph on 220 vertices. The vertices correspond to the 3-element
subsets of {1,...,12} and two such vertices are adjacent whenever the subsets
intersect in exactly one element.

    sage: haemers
    haemers: Graph on 220 vertices
    sage: haemers.is_regular()
    True
    sage: max(haemers.degree())
    108
"""
haemers = Graph([Subsets(12,3), lambda s1,s2: len(s1.intersection(s2))==1])
haemers.relabel()
haemers.name(new="haemers")

"""
The Pepper residue graph was described by Ryan Pepper in personal communication.
It is a graph which demonstrates that the residue is not monotone. The graph is
constructed by taking the complete graph on 3 vertices and attaching a pendant
vertex to each of its vertices, then taking two copies of this graph, adding a
vertex and connecting it to all the pendant vertices. This vertex has degree
sequence [6, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2] which gives residue equal to 4.
By removing the central vertex with degree 6, you get a graph with degree
sequence [3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1] which has residue equal to 5.

    sage: pepper_residue_graph
    pepper_residue_graph: Graph on 13 vertices
    sage: sorted(pepper_residue_graph.degree(), reverse=True)
    [6, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2]
    sage: residue(pepper_residue_graph)
    4
    sage: residue(pepper_residue_graph.subgraph(vertex_property=lambda v:pepper_residue_graph.degree(v)<6))
    5
"""
pepper_residue_graph = graphs.CompleteGraph(3)
pepper_residue_graph.add_edges([(i,i+3) for i in range(3)])
pepper_residue_graph = pepper_residue_graph.disjoint_union(pepper_residue_graph)
pepper_residue_graph.add_edges([(0,v) for v in pepper_residue_graph.vertices() if pepper_residue_graph.degree(v)==1])
pepper_residue_graph.relabel()
pepper_residue_graph.name(new="pepper_residue_graph")

"""
The Barrus graph was suggested by Mike Barrus in "Havel-Hakimi residues of Unigraphs" (2012) as an example of a graph whose residue (2) is
less than the independence number of any realization of the degree sequence. The degree sequence is [4^8,2].
The realization is the one given by reversing the Havel-Hakimi process.

    sage: barrus_graph
    barrus_graph: Graph on 9 vertices
    sage: residue(barrus_graph)
    2
    sage: independence_number(barrus_graph)
    3
"""
barrus_graph = Graph('HxNEG{W')
barrus_graph.name(new = "barrus_graph")

#CE to conjecture: (is_split)->((is_eulerian)->(is_regular))
#split graph from k4 and e2 that is eulerian but not regular
k4e2split = graphs.CompleteGraph(4)
k4e2split.add_vertices([4,5])
k4e2split.add_edge(4,0)
k4e2split.add_edge(4,1)
k4e2split.add_edge(5,2)
k4e2split.add_edge(5,3)
k4e2split.name(new = "k4e2split")

houseX=graphs.HouseXGraph()
houseX.name(new = "houseX")

triangle_star = Graph("H}qdB@_")
#a counterexample to: (has_residue_equals_alpha)->((is_eulerian)->(alpha_leq_order_over_two))
triangle_star.name(new = "triangle_star")

#flower with n petals
def flower(n):
    g = graphs.StarGraph(2*n)
    for x in range(n):
        v = 2*x+1
        g.add_edge(v,v+1)
    return g

flower_with_3_petals = flower(3)
flower_with_3_petals.name(new = "flower_with_3_petals")

flower_with_4_petals = flower(4)
flower_with_4_petals.name(new = "flower_with_4_petals")

"""
Non-perfect, alpha = 2, order = 6

    sage: pepper_non_perfect_graph.is_perfect()
    false
    sage: independence_number(pepper_non_perfect_graph)
    2
    sage: pepper_non_perfect_graph.order()
    6
"""
pepper_non_perfect_graph = Graph("EdZG")
pepper_non_perfect_graph.name(new = "pepper_non_perfect")

# Gallai Tree graph
gallai_tree = Graph("`hCKGC@?G@?K?@?@_?w?@??C??G??G??c??o???G??@_??F???N????_???G???B????C????W????G????G????C")
gallai_tree.name(new = "gallai_tree")

# Trigonal Antiprism w/ capped top face
trig_antiprism_capped = Graph("Iw?EthkF?")
trig_antiprism_capped.name(new = "trig_antiprism_capped")

"""
From Willis's thesis, page 4
Alpha = Fractional Alpha = 4
    
    sage: independence_number(willis_page4)
    4
    sage: fractional_alpha(willis_page4)
    4
"""
willis_page4 = Graph("GlCKIS")
willis_page4.name(new = "willis_page4")

"""
From Willis's thesis, page 13, Fig. 2.7

    sage: independence_number(willis_page13_fig27)
    4
    sage: willis_page13_fig27.order()
    7
    sage: willis_page13_fig27.size()
    15
"""
willis_page13_fig27 = Graph("Fs\zw")
willis_page13_fig27.name(new = "willis_page13_fig27")

"""
From Willis's thesis, page 9, Figure 2.1
Graph for which the Cvetkovic bound is the best upper bound present in the thesis

    sage: independence_number(willis_page9)
    3
    sage: willis_page9.order()
    8
    sage: willis_page9.size()
    12
    sage: max_degree(willis_page9)
    3
    sage: min_degree(willis_page9)
    3
"""
willis_page9 = Graph("GrCkQK")
willis_page9.name(new = "willis_page9")

"""
From Willis's thesis, page 10, Figure 2.2
Graph for which the Cvetkovic bound is the best upper bound present in the thesis

    sage: independence_number(willis_page10_fig23)
    4
    sage: willis_page10_fig23.order()
    10
    sage: willis_page10_fig23.size()
    15
    sage: max_degree(willis_page10_fig23)
    3
    sage: min_degree(willis_page10_fig23)
    3
"""
willis_page10_fig23 = Graph("G|eKHw")
willis_page10_fig23.name(new = "willis_page10_fig23")

"""
From Willis's thesis, page 10, Figure 2.4
Graph for which the Cvetkovic bound is the best upper bound present in the thesis

    sage: independence_number(willis_page10_fig24)
    9
    sage: willis_page10_fig24.order()
    24
    sage: willis_page10_fig24.size()
    36
    sage: max_degree(willis_page10_fig24)
    3
    sage: min_degree(willis_page10_fig24)
    3
"""
willis_page10_fig24 = Graph("WvOGWK@?G@_B???@_?O?F?????G??W?@K_?????G??@_?@B")
willis_page10_fig24.name(new = "willis_page10_fig24")

"""
From Willis's thesis, page 13, Figure 2.6
Graph for which the fractional independence bound is the best upper bound present in the thesis

    sage: independence_number(willis_page13_fig26)
    3
    sage: willis_page13_fig26.order()
    7
    sage: willis_page13_fig26.size()
    12
    sage: max_degree(willis_page13_fig26)
    4
    sage: min_degree(willis_page13_fig26)
    3
"""
willis_page13_fig26 = Graph("FstpW")
willis_page13_fig26.name(new = "willis_page13_fig26")

"""
From Willis's thesis, page 18, Figure 2.9
Graph for which the minimum degree  is the best upper bound present in the thesis

    sage: independence_number(willis_page18)
    2
    sage: willis_page18.order()
    6
    sage: willis_page18.size()
    12
    sage: max_degree(willis_page18)
    4
    sage: min_degree(willis_page18)
    4
"""
willis_page18 = Graph("E}lw")
willis_page18.name(new = "willis_page18")

"""
From Willis's thesis, page 21, Figure 3.1
Graph for which n/chi is the best lower bound present in the thesis

    sage: independence_number(willis_page21)
    4
    sage: willis_page21.order()
    12
    sage: willis_page21.size()
    20
    sage: max_degree(willis_page21)
    4
    sage: chromatic_num(willis_page21)
    3
"""
willis_page21 = Graph("KoD?Xb?@HBBB")
willis_page21.name(new = "willis_page21")

"""
From Willis's thesis, page 25, Figure 3.2
Graph for which residue is the best lower bound present in the thesis

    sage: independence_number(willis_page25_fig32)
    3
    sage: willis_page25_fig32.order()
    8
    sage: willis_page25_fig32.size()
    15
    sage: max_degree(willis_page25_fig32)
    6
    sage: chromatic_num(willis_page25_fig32)
    4
"""
willis_page25_fig32 = Graph("G@N@~w")
willis_page25_fig32.name(new = "willis_page25_fig32")

"""
From Willis's thesis, page 25, Figure 3.3
Graph for which residue is the best lower bound present in the thesis

    sage: independence_number(willis_page25_fig33)
    4
    sage: willis_page25_fig33.order()
    14
    sage: willis_page25_fig33.size()
    28
    sage: max_degree(willis_page25_fig33)
    4
    sage: chromatic_num(willis_page25_fig33)
    4
"""
willis_page25_fig33 = Graph("Mts?GKE@QDCIQIKD?")
willis_page25_fig33.name(new = "willis_page25_fig33")

# The Lemke Graph
lemke = Graph("G_?ztw")
lemke.name(new = "Lemke")

"""
From Willis's thesis, page 29, Figure 3.6
Graph for which the Harant Bound is the best lower bound present in the thesis

    sage: independence_number(willis_page29)
    4
    sage: willis_page29.order()
    14
    sage: willis_page29.size()
    28
    sage: max_degree(willis_page29)
    4
    sage: chromatic_num(willis_page29)
    4
"""
willis_page29 = Graph("[HCGGC@?G?_@?@_?_?M?@o??_?G_?GO?CC?@?_?GA??_C?@?C?@?A??_?_?G?D?@")
willis_page29.name(new = "willis_page29")

"""
From Willis's thesis, page 35, Figure 5.1
A graph where none of the upper bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page35_fig51)
    2
    sage: willis_page35_fig51.order()
    10
"""
willis_page35_fig51 = Graph("I~rH`cNBw")
willis_page35_fig51.name(new = "willis_page35_fig51")

"""
From Willis's thesis, page 35, Figure 5.2
A graph where none of the upper bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page35_fig52)
    2
    sage: willis_page35_fig52.order()
    10
"""
willis_page35_fig52 = Graph("I~zLa[vFw")
willis_page35_fig52.name(new = "willis_page35_fig52")

"""
From Willis's thesis, page 36, Figure 5.3
A graph where none of the upper bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page36_fig53)
    4
    sage: willis_page36_fig53.order()
    11
"""
willis_page36_fig53 = Graph("JscOXHbWqw?")
willis_page36_fig53.name(new = "willis_page36_fig53")

"""
From Willis's thesis, page 36, Figure 5.4
A graph where none of the upper bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page36_fig54)
    2
    sage: willis_page36_fig54.order()
    9
    sage: willis_page36_fig54.size()
    24
"""
willis_page36_fig54 = Graph("H~`HW~~")
willis_page36_fig54.name(new = "willis_page36_fig54")

"""
From Willis's thesis, page 36, Figure 5.5
A graph where none of the lower bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page36_fig55)
    3
    sage: willis_page36_fig54.order()
    7
    sage: willis_page36_fig54.size()
    13
"""
willis_page36_fig55 = Graph("F@^vo")
willis_page36_fig55.name(new = "willis_page36_fig55")

"""
From Willis's thesis, page 37, Figure 5.6
A graph where none of the lower bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page37_fig56)
    3
    sage: willis_page37_fig56.order()
    7
    sage: willis_page37_fig56.size()
    15
"""
willis_page37_fig56 = Graph("Fimzw")
willis_page37_fig56.name(new = "willis_page37_fig56")

"""
From Willis's thesis, page 37, Figure 5.8
A graph where none of the lower bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page37_fig58)
    3
    sage: willis_page37_fig58.order()
    9
    sage: willis_page37_fig58.size()
    16
"""
willis_page37_fig58 = Graph("H?iYbC~")
willis_page37_fig58.name(new = "willis_page37_fig58")

"""
From Willis's thesis, page 39, Figure 5.10
A graph where none of the upper or lower bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page39_fig510)
    5
    sage: willis_page39_fig510.order()
    12
    sage: willis_page39_fig510.size()
    18
"""
willis_page39_fig510 = Graph("Kt?GOKEOGal?")
willis_page39_fig510.name(new = "willis_page39_fig510")

"""
From Willis's thesis, page 39, Figure 5.11
A graph where none of the upper or lower bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page39_fig511)
    5
    sage: willis_page39_fig511.order()
    12
    sage: willis_page39_fig511.size()
    18
"""
willis_page39_fig511 = Graph("KhCGKCHHACqC")
willis_page39_fig511.name(new = "willis_page39_fig511")

"""
From Willis's thesis, page 40, Figure 5.12
A graph where none of the upper or lower bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page40_fig512)
    6
    sage: willis_page40_fig512.order()
    14
    sage: willis_page40_fig512.size()
    21
"""
willis_page40_fig512 = Graph("Ms???\?OGdAQJ?J??")
willis_page40_fig512.name(new = "willis_page40_fig512")

"""
From Willis's thesis, page 41, Figure 5.14
A graph where none of the upper or lower bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page41_fig514)
    5
    sage: willis_page41_fig514.order()
    12
    sage: willis_page41_fig514.size()
    18
"""
willis_page41_fig514 = Graph("Kt?GGGBQGeL?")
willis_page41_fig514.name(new = "willis_page41_fig514")

"""
From Willis's thesis, page 41, Figure 5.15
A graph where none of the upper or lower bounds in the thesis give the exact value for alpha

    sage: independence_number(willis_page41_fig515)
    4
    sage: willis_page41_fig515.order()
    11
    sage: willis_page41_fig515.size()
    22
"""
willis_page41_fig515 = Graph("JskIIDBLPh?")
willis_page41_fig515.name(new = "willis_page41_fig515")

"""
From Elphick-Wocjan page 8
"""
elphick_wocjan_page8 = Graph("F?Azw")
elphick_wocjan_page8.name(new = "Elphick-Wocjan p.8")

"""
From Elphick-Wocjan page 9
"""
elphick_wocjan_page9 = Graph("FqhXw")
elphick_wocjan_page9.name(new = "Elphick-Wocjan p.9")

"""
An odd wheel with 8 vertices
p.175
Rebennack, Steffen, Gerhard Reinelt, and Panos M. Pardalos. "A tutorial on branch and cut algorithms for the maximum stable set problem." International Transactions in Operational Research 19.1-2 (2012): 161-199.

    sage: odd_wheel_8.order()
    8
    sage: odd_wheel_8.size()
    14
"""
odd_wheel_8 = Graph("G|eKMC")
odd_wheel_8.name(new = "odd_wheel_8")

"""
An odd antihole with 7 vertices
p.175
Rebennack, Steffen, Gerhard Reinelt, and Panos M. Pardalos. "A tutorial on branch and cut algorithms for the maximum stable set problem." International Transactions in Operational Research 19.1-2 (2012): 161-199.

    sage: odd_antihole_7.order()
    7
    sage: odd_antihole_7.size()
    14
"""
odd_antihole_7 = Graph("F}hXw")
odd_antihole_7.name(new = "odd_antihole_7")

"""
A facet-inducing graph
p.176
Rebennack, Steffen, Gerhard Reinelt, and Panos M. Pardalos. "A tutorial on branch and cut algorithms for the maximum stable set problem." International Transactions in Operational Research 19.1-2 (2012): 161-199.

    sage: odd_antihole_7.order()
    8
    sage: odd_antihole_7.size()
    11
"""
facet_inducing = Graph("G@hicc")
facet_inducing.name(new = "facet_inducing")

"""
Double Fork
p.185
Rebennack, Steffen, Gerhard Reinelt, and Panos M. Pardalos. "A tutorial on branch and cut algorithms for the maximum stable set problem." International Transactions in Operational Research 19.1-2 (2012): 161-199.

    sage: double_fork.order()
    6
    sage: double_fork.size()
    5
"""
double_fork = Graph("E?dg")
double_fork.name(new = "double_fork")

"""
Golomb Graph
Appears in THE FRACTIONAL CHROMATIC NUMBER OF THE PLANE by Cranston and Rabern
"""
golomb = Graph("I?C]dPcww")
golomb.name(new = "Golomb Graph")

# Ciliate 4, 1
c4_1 = Graph("G?_gqK")
c4_1.name(new = "c4_1")

# Ciliate 4, 2
c4_2 = Graph("K?`@?_G?gB?b")
c4_2.name(new = "c4_2")

# Ciliate 6, 1
c6_1 = Graph("K??C?SEO?acE")
c6_1.name(new = "c6_1")

"""
Fig. 1, G1 p. 454 of 
Steinberg’s Conjecture is false by 
 Vincent Cohen-Addad, Michael Hebdige, Daniel Král,
 Zhentao Li, Esteban Salgado
"""
steinberg_ce_g1 = Graph("N?CWGOOOH@OO_POdCHO")
steinberg_ce_g1.name(new = "steinberg_ce_g1")

"""
4-pan from p. 1691 of 
Graphs with the Strong Havel–Hakimi Property by Michael D. Barrus and Grant Molnar
"""
four_pan = Graph("DBw")
four_pan.name(new = "4-pan")

"""
kite from p. 1691 of 
Graphs with the Strong Havel–Hakimi Property by Michael D. Barrus and Grant Molnar
NOTE: Called kite in the paper, but will be called kite_with_tail here because we already have a kite
"""
kite_with_tail = Graph("DJk")
kite_with_tail.name(new = "kite with tail")

"""
Chartrand Fig 1.1

    sage: chartrand_11.order()
    8
    sage: chartrand_11.size()
    15
"""
chartrand_11 = Graph("G`RHx{")
chartrand_11.name(new = "chartrand fig 1.1")

"""
Chartrand Fig 1.2

    sage: chartrand_12.order()
    8
    sage: chartrand_12.size()
    9
"""
chartrand_12 = Graph("G??|Qo")
chartrand_12.name(new = "chartrand fig 1.2")

"""
Chartrand Fig 1.3

    sage: chartrand_13.order()
    8
    sage: chartrand_13.size()
    10
"""
chartrand_13 = Graph("G`o_g[")
chartrand_13.name(new = "chartrand fig 1.3")

"""
Chartrand Fig 1.8 - G

    sage: chartrand_18_g.order()
    7
    sage: chartrand_18_g.size()
    8
"""
chartrand_18_g = Graph("Fo@Xo")
chartrand_18_g.name(new = "chartrand fig 1.8 - G")

"""
Chartrand Fig 1.8 - F1

    sage: chartrand_18_f1.order()
    7
    sage: chartrand_18_f1.size()
    10
"""
chartrand_18_f1 = Graph("F@J]o")
chartrand_18_f1.name(new = "chartrand fig 1.8 - F1")

"""
Chartrand Fig 1.8 - F2

    sage: chartrand_18_f2.order()
    7
    sage: chartrand_18_f2.size()
    10
"""
chartrand_18_f2 = Graph("F?NVo")
chartrand_18_f2.name(new = "chartrand fig 1.8 - F2")

#GRAPH LISTS

#all with order 3 to 9, a graph is chroamtic_index_critical if it is class 2 removing any edge increases chromatic index

#all with order 3 to 9, a graph is alpha_critical if removing any edge increases independence number
#all alpha critical graphs of orders 2 to 9, 53 in total
alpha_critical_graph_names = ['A_','Bw', 'C~', 'Dhc', 'D~{', 'E|OW', 'E~~w', 'FhCKG', 'F~[KG', 'FzEKW', 'Fn[kG', 'F~~~w', 'GbL|TS', 'G~?mvc', 'GbMmvG', 'Gb?kTG', 'GzD{Vg', 'Gb?kR_', 'GbqlZ_', 'GbilZ_', 'G~~~~{', 'GbDKPG', 'HzCGKFo', 'H~|wKF{', 'HnLk]My', 'HhcWKF_', 'HhKWKF_', 'HhCW[F_', 'HxCw}V`', 'HhcGKf_', 'HhKGKf_', 'Hh[gMEO', 'HhdGKE[', 'HhcWKE[', 'HhdGKFK', 'HhCGGE@', 'Hn[gGE@', 'Hn^zxU@', 'HlDKhEH', 'H~~~~~~', 'HnKmH]N', 'HnvzhEH', 'HhfJGE@', 'HhdJGM@', 'Hj~KHeF', 'HhdGHeB', 'HhXg[EO', 'HhGG]ES', 'H~Gg]f{', 'H~?g]vs', 'H~@w[Vs', 'Hn_k[^o']
alpha_critical_easy = []
for s in alpha_critical_graph_names:
    g = Graph(s)
    g.name(new="alpha_critical_"+ s)
    alpha_critical_easy.append(g)

#all order-7 chromatic_index_critical_graphs (and all are overfull)
L = ['FhCKG', 'FzCKW', 'FzNKW', 'FlSkG', 'Fn]kG', 'FlLKG', 'FnlkG', 'F~|{G', 'FnlLG', 'F~|\\G', 'FnNLG', 'F~^LW', 'Fll\\G', 'FllNG', 'F~l^G', 'F~|^w', 'F~~^W', 'Fnl^W', 'FlNNG', 'F|\\Kg', 'F~^kg', 'FlKMG']
chromatic_index_critical_7 = []
for s in L:
    g=Graph(s)
    g.name(new="chromatic_index_critical_7_" + s)
    chromatic_index_critical_7.append(g)

#class 0 pebbling graphs
import pickle, os, os.path
try:
    class0graphs_dict = pickle.load(open(os.environ['HOME'] + "/objects-invariants-properties/class0graphs_dictionary.pickle","r"))
except:
    class0graphs_dict = {}
class0graphs = []
for d in class0graphs_dict:
    g = Graph(class0graphs_dict[d])
    g.name(new = d)
    class0graphs.append(g)
class0small = [g for g in class0graphs if g.order() < 30]

c5=graphs.CycleGraph(5)
c5.name(new = "c5")

sage_graphs = [graphs.Balaban11Cage(), graphs.BiggsSmithGraph(), graphs.BrouwerHaemersGraph(), 
graphs.CameronGraph(), graphs.Cell120(), graphs.Cell600(), graphs.DejterGraph(), 
graphs.DoubleStarSnark(), graphs.DurerGraph(), graphs.DyckGraph(), 
graphs.EllinghamHorton54Graph(), graphs.EllinghamHorton78Graph(), graphs.ErreraGraph(), 
graphs.F26AGraph(), graphs.FosterGraph(), graphs.FranklinGraph(), graphs.GoldnerHararyGraph(), 
graphs.GossetGraph(), graphs.HallJankoGraph(), graphs.HarborthGraph(), graphs.HarriesGraph(), 
graphs.HarriesWongGraph(), graphs.HigmanSimsGraph(), graphs.HoffmanGraph(), graphs.HoltGraph(), 
graphs.HortonGraph(), graphs.IoninKharaghani765Graph(), graphs.JankoKharaghaniTonchevGraph(), 
graphs.KittellGraph(), graphs.KrackhardtKiteGraph(), graphs.Klein3RegularGraph(), 
graphs.Klein7RegularGraph(), graphs.LocalMcLaughlinGraph(), graphs.LjubljanaGraph(), 
graphs.M22Graph(), graphs.MarkstroemGraph(), graphs.McGeeGraph(), graphs.McLaughlinGraph(), 
graphs.MeredithGraph(), graphs.NauruGraph(), graphs.PoussinGraph(), graphs.PerkelGraph(), 
graphs.SchlaefliGraph(), graphs.SimsGewirtzGraph(), graphs.SousselierGraph(), 
graphs.TruncatedIcosidodecahedralGraph(), graphs.TruncatedTetrahedralGraph(), 
graphs.Tutte12Cage(), graphs.WatkinsSnarkGraph(), graphs.WellsGraph(), 
graphs.WienerArayaGraph(), graphs.WorldMap(), graphs.MathonStronglyRegularGraph(0), 
graphs.MathonStronglyRegularGraph(1), graphs.MathonStronglyRegularGraph(2), 
graphs.JankoKharaghaniGraph(936), graphs.JankoKharaghaniGraph(1800), graphs.IcosahedralGraph()]

graph_objects = [paw, p4, dart, c6ee, graphs.DodecahedralGraph(), c8chorded, c8chords, graphs.ClebschGraph(),  prismy, c24, c26, c60, c6xc6, holton_mckay, sixfour, c4, non_ham_over, throwing, throwing2, throwing3, kratsch_lehel_muller, graphs.BlanusaFirstSnarkGraph(), graphs.BlanusaSecondSnarkGraph(), ryan3, k10, graphs.MycielskiGraph(5), c3mycielski, s13e, ryan2, s22e, graphs.BullGraph(), graphs.ChvatalGraph(), graphs.ClawGraph(), graphs.DesarguesGraph(), graphs.DiamondGraph(), graphs.FlowerSnark(), graphs.FruchtGraph(), graphs.HoffmanSingletonGraph(), graphs.HouseGraph(), graphs.ThomsenGraph(), pete , graphs.GrotzschGraph(), graphs.GrayGraph(), graphs.HeawoodGraph(), graphs.HerschelGraph(), graphs.CoxeterGraph(), graphs.BrinkmannGraph(), graphs.TutteCoxeterGraph(), graphs.TutteGraph(), graphs.RobertsonGraph(), graphs.FolkmanGraph(), graphs.Balaban10Cage(), graphs.PappusGraph(), graphs.TietzeGraph(), graphs.SylvesterGraph(), graphs.SzekeresSnarkGraph(), graphs.MoebiusKantorGraph(), ryan, inp, c4c4, regular_non_trans, bridge, p10k4, c100, starfish, c5k3, k5pendant, graphs.ShrikhandeGraph(), sylvester, fork, edge_critical_5, edge_critical_11_1, edge_critical_11_2, pete_minus, bow_tie, pepper_residue_graph, barrus_graph, p5, c6, ce3, ce4, ce5, k4e2split, flower_with_3_petals, flower_with_4_petals, paw_x_paw, houseX, ce7, triangle_star, ce8, ce9, ce10, p3, binary_octahedron, prism, ce12, ce13, ce14, gallai_tree, willis_page4, willis_page13_fig27, willis_page9, willis_page10_fig23, willis_page10_fig24, willis_page13_fig26, willis_page18, willis_page21, willis_page25_fig32, willis_page25_fig33, lemke, k5_3, willis_page29, p9, ce15, willis_page35_fig51, willis_page35_fig52, willis_page36_fig53, willis_page36_fig54, willis_page36_fig55, willis_page37_fig56, willis_page37_fig58, trig_antiprism_capped, willis_page39_fig510, willis_page39_fig511, willis_page40_fig512, willis_page41_fig514, willis_page41_fig515, k3_3_line_graph, ce16, ce17, elphick_wocjan_page8, elphick_wocjan_page9, p29, ce18, ce19, ce20, ce21, ce22, ce23, ce24, ce25, ce26, ce27, c102, p102, ce28, ce29, ce30, ce31, ce32, ce33, ce34, ce35, ce36, ce37, ce38, ce39, ce40, ce41, ce42, ce43, ce44, ce45, ce47, ce48, ce49, ce50, ce51, ce52, ce53, ce54, ce55, ce56, ce57, k37, c34, ce58, ce59, ce60, ce61, ce62, ce63, ce64, ce65, ce66, ce67, ce68, ce69, ce70, ce71, ce72, ce73, k1_9, ce74, ce75, ce76, ce77, ce78, ce79, ce80, ce81, ce82, ce83, ce84, ce85, ce86, ce87, ce88, ce89, ce91, c22, odd_wheel_8, odd_antihole_7, ce90, golomb, c4_1, c4_2, c6_1, steinberg_ce_g1, four_pan, kite_with_tail, ce92, chartrand_11, chartrand_12, chartrand_13, chartrand_18_g, chartrand_18_f1, chartrand_18_f2, double_fork, facet_inducing] + alpha_critical_easy + sage_graphs

# This is commented out as the original list that includes isomorphic pairs
# graph_objects = [paw, kite, p4, dart, k3, k4, k5, c6ee, c5chord, graphs.DodecahedralGraph(), c8chorded, c8chords, graphs.ClebschGraph(),  prismy, c24, c26, c60, c6xc6, holton_mckay, sixfour, c4, graphs.PetersenGraph(), p2, graphs.TutteGraph(), non_ham_over, throwing, throwing2, throwing3, kratsch_lehel_muller, graphs.BlanusaFirstSnarkGraph(), graphs.BlanusaSecondSnarkGraph(), graphs.FlowerSnark(), k1_3, ryan3, k10, graphs.MycielskiGraph(5), c3mycielski, s13e, ryan2, s22e, difficult11, graphs.BullGraph(), graphs.ChvatalGraph(), graphs.ClawGraph(), graphs.DesarguesGraph(), graphs.DiamondGraph(), graphs.FlowerSnark(), graphs.FruchtGraph(), graphs.HoffmanSingletonGraph(), graphs.HouseGraph(), graphs.OctahedralGraph(), graphs.ThomsenGraph(), pete , graphs.PappusGraph(), graphs.GrotzschGraph(), graphs.GrayGraph(), graphs.HeawoodGraph(), graphs.HerschelGraph(), graphs.CoxeterGraph(), graphs.BrinkmannGraph(), graphs.TutteCoxeterGraph(), graphs.TutteGraph(), graphs.RobertsonGraph(), graphs.FolkmanGraph(), graphs.Balaban10Cage(), graphs.PappusGraph(), graphs.TietzeGraph(), graphs.SylvesterGraph(), graphs.SzekeresSnarkGraph(), graphs.MoebiusKantorGraph(), ryan, inp, c4c4, regular_non_trans, bridge, p10k4, c100, starfish, c5k3, k5pendant, graphs.ShrikhandeGraph(), sylvester, fork, edge_critical_5, edge_critical_11_1, edge_critical_11_2, pete_minus, c5, bow_tie, pepper_residue_graph, barrus_graph, p5, c6, c9, ce3, ce4, ce5, k4e2split, flower_with_3_petals, flower_with_4_petals, paw_x_paw, graphs.WagnerGraph(), houseX, ce7, triangle_star, ce8, ce9, ce10, p3, binary_octahedron, ce11, prism, ce12, ce13, ce14, pepper_non_perfect_graph, gallai_tree, willis_page4, willis_page13_fig27, willis_page9, willis_page10_fig23, willis_page10_fig24, willis_page13_fig26, willis_page18, willis_page21, willis_page25_fig32, willis_page25_fig33, lemke, k5_3, willis_page29, p9, ce15, willis_page35_fig51, willis_page35_fig52, willis_page36_fig53, willis_page36_fig54, willis_page36_fig55, willis_page37_fig56, willis_page37_fig58, trig_antiprism_capped, willis_page39_fig510, willis_page39_fig511, willis_page40_fig512, willis_page41_fig514, willis_page41_fig515, k3_3_line_graph, ce16, ce17, elphick_wocjan_page8, elphick_wocjan_page9, p29, ce18, ce19, ce20, ce21, ce22, ce23, ce24, ce25, ce26, ce27, c102, p102, ce28, ce29, ce30, ce31, ce32, ce33, ce34, ce35, ce36, ce37, ce38, ce39, ce40, ce41, ce42, ce43, ce44, ce45, ce47, ce48, ce49, ce50, ce51, ce52, ce53, ce54, ce55, ce56, ce57, k37, c34, ce58, ce59, ce60, ce61, ce62, ce63, ce64, ce65, ce66, ce67, ce68, ce69, ce70, ce71, ce72, ce73, k1_9, ce74, ce75, ce76, ce77, ce78, ce79, ce80, ce81, ce82, ce83, ce84, ce85, ce86, ce87, ce88, ce89, ce91, c22, odd_wheel_8, odd_antihole_7, ce90, golomb, c4_1, c4_2, c6_1, steinberg_ce_g1, four_pan, kite_with_tail, ce92, chartrand_11, chartrand_12, chartrand_13, chartrand_18_g, chartrand_18_f1, chartrand_18_f2, double_fork, facet_inducing] + alpha_critical_easy

alpha_critical_hard = [Graph('Hj\\x{F{')]

chromatic_index_critical_graphs = chromatic_index_critical_7 + [edge_critical_5, edge_critical_11_1, edge_critical_11_2, pete_minus]

#graphs where some computations are especially slow
problem_graphs = [graphs.MeredithGraph(), graphs.SchlaefliGraph(), haemers, c3mycielski4, alon_seymour] + chromatic_index_critical_7 + class0small + alpha_critical_hard
#meredith graph is 4-reg, class2, non-hamiltonian: http://en.wikipedia.org/wiki/Meredith_graph


#graph_objects: all graphs with no duplicates

#obvious way to remove duplicates in list of ALL objects

"""
graph_objects = []
for g in union_objects, idfun=Graph.graph6_string:
    if not g in graph_objects:
        graph_objects.append(g)
"""

#fast way to remove duplicates in list of ALL objects
#from : http://www.peterbe.com/plog/uniqifiers-benchmark


def remove_duplicates(seq, idfun=None):
    # order preserving
    if idfun is None:
        def idfun(x): return x
    seen = {}
    result = []
    for item in seq:
        marker = idfun(item)
        # in old Python versions:
        # if seen.has_key(marker)
        # but in new ones:
        if marker in seen: continue
        seen[marker] = 1
        result.append(item)
    return result

#could run this occasionally to check there are no duplicates
#graph_objects = remove_duplicates(union_objects, idfun=Graph.graph6_string)
