# Test the correctness of f(x) and prox(f,x,gamma) for a few hardcoded cases

stuff = [
  Dict( "f"      => NormL2(0.5),
        "x"      => [-1.472658469388188,-0.2715944116787317,-0.05323943816203797,1.0714599486778327,-1.5331256392574706,0.4083764366610342,-0.9444383691511559,-0.7504607478410741,0.7438914169983039,-0.15652009656239366],
        "f(x)"   => 1.4092215084194275,
        "gamma"  => 0.3,
        "y"      => [-1.3942822988967276,-0.2571399197807538,-0.0504059887445427,1.0144359140099486,-1.4515313531517497,0.38664228587878424,-0.8941745339321049,-0.7105205711181053,0.7043008658028084,-0.14818996026228431],
        "f(y)"   => 1.3342215084194275,
      ),

  Dict( "f"      => NormL1(0.6),
        "x"      => [0.24488032099324117,0.6361148017053393,-0.7468003460445393,-0.39461027607226284,-0.766936244339526,0.08238242897650354,-1.4822688010626806,0.23915849610266143,-0.5124773673251194,0.14222091048851146],
        "f(x)"   => 3.148709995866231,
        "gamma"  => 0.4,
        "y"      => [0.004880320993241177,0.3961148017053393,-0.5068003460445393,-0.15461027607226285,-0.526936244339526,0.0,-1.2422688010626806,0.0,-0.2724773673251194,0.0],
        "f(y)"   => 1.8624528945256253,
      ),

  Dict( "f"      => NormL1(0.45),
        "x"      => Complex{Float64}[0.48383139850861223 + 0.14880666357496075im -0.476452189543104 + 0.5373862840906938im -0.47734819961688757 + 1.5821400827207137im;
                      0.731503968722083 + 0.16028191387997026im -0.43401778891072196 + 0.31094682923492956im -0.6171419681732582 + 1.6633154232600766im;
                      0.8143294700727339 + 0.9825764200556435im 0.9956758203961695 + 0.6666719567389796im 0.9364063971363472 + 0.03175404144697325im],
        "f(x)"   => 4.2053455230857,
        "gamma"  => 0.55,
        "y"      => Complex{Float64}[0.24726722632640047 + 0.07604924168725978im -0.3122580040459822 + 0.3521930891591931im -0.40585785798447027 + 1.3451899169615815im;
                      0.48973954188193203 + 0.1073082231018745im -0.23282376734737972 + 0.16680379025222528im -0.5310468296940786 + 1.4312725885716275im;
                      0.6563976577692634 + 0.7920146383087744im 0.7900191090320431 + 0.5289709506755073im 0.6890485776638721 + 0.02336600557303825im],
        "f(y)"   => 3.2029705230857,
      ),

  Dict( "f"      => NormL0(0.6),
        "x"      => [0.14315338571566838,0.6534693088076117,-0.35221109634545744,-1.0843092036012738,-0.21687748781464977,0.38416472626106707,0.46644748241896083,-1.7104462861427205,0.29913996761129763,1.4566599915371263],
        "f(x)"   => 6.0,
        "gamma"  => 0.4,
        "y"      => [0.0,0.0,-0.0,-1.0843092036012738,-0.0,0.0,0.0,-1.7104462861427205,0.0,1.4566599915371263],
        "f(y)"   => 1.7999999999999998,
      ),

  Dict( "f"      => NormL0(0.45),
        "x"      => [-0.9617311985566904 -0.518012365217699 0.4416517549177308 1.0497034474382447;
         0.273994311984438 0.33356795744106194 0.24747082687586053 1.369695656039301;
         -0.778053112909331 1.7320620010973118 1.6366272293068256 -0.5828690748881356;
         -0.9706863561972737 1.4039270788692668 1.126542963082653 -0.06669611410738466],
        "f(x)"   => 7.2,
        "gamma"  => 0.55,
        "y"      => [-0.9617311985566904 -0.0 0.0 1.0497034474382447;
         0.0 0.0 0.0 1.369695656039301;
         -0.778053112909331 1.7320620010973118 1.6366272293068256 -0.0;
         -0.9706863561972737 1.4039270788692668 1.126542963082653 -0.0],
        "f(y)"   => 4.05,
      ),

  Dict( "f"      => IndBallL0(5),
        "x"      => [-0.1553737486872724,-0.3805093036732066,-1.1359877819928568,-1.4074575535421312,-0.014354093517417054,-0.7828347886276972,0.7289354484199504,0.8077049251507309,-0.011180606660407861,-0.08252274792015224],
        "f(x)"   => +Inf,
        "gamma"  => rand(),
        "y"      => [0.0,0.0,-1.1359877819928568,-1.4074575535421312,0.0,-0.7828347886276972,0.7289354484199504,0.8077049251507309,0.0,0.0],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndBallL0(4),
        "x"      => [0.11718035918656403 0.7413899585297815 2.536889607960003;
         -0.7905417065462554 -2.528853472235987 -0.21157829025742098;
         0.7335959778823463 -0.842619689213128 -1.6389387126978623],
        "f(x)"   => +Inf,
        "gamma"  => rand(),
        "y"      => [0.0 0.0 2.536889607960003;
         0.0 -2.528853472235987 0.0;
         0.0 -0.842619689213128 -1.6389387126978623],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndBallL0(6),
        "x"      => Complex{Float64}[0.4123814653942677 + 0.5477281536949097im 0.1180210182125836 + 0.48721833026698946im 0.18165793415201192 + 0.33083070659243896im;
                         0.14567574789746107 + 0.9797631246910778im 0.8859137252355573 + 0.24593117579841173im 0.1119791184116512 + 0.1782455833267571im;
                         0.6971105660873709 + 0.4456778795521643im 0.6815819496354292 + 0.7246319393377785im 0.36348180980544 + 0.06420454004464782im],
        "f(x)"   => +Inf,
        "gamma"  => rand(),
        "y"      => Complex{Float64}[0.4123814653942677 + 0.5477281536949097im 0.1180210182125836 + 0.48721833026698946im 0.0 + 0.0im;
                         0.14567574789746107 + 0.9797631246910778im 0.8859137252355573 + 0.24593117579841173im 0.0 + 0.0im;
                         0.6971105660873709 + 0.4456778795521643im 0.6815819496354292 + 0.7246319393377785im 0.0 + 0.0im],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndBallRank(2),
        "x"      => [0.3251909299381841 0.32669352058736867 0.30878476770613905 0.16430992796261545 0.34512333306839693 0.7106693424891355 0.671658396200979;
         0.6281016205611978 0.6824858855301283 0.606248150077644 0.7254139031156339 0.1170408384465551 0.4388768890760757 0.8615311184291088;
         0.8463682898731775 0.41051188285054874 0.2212552529414713 0.017263014648567054 0.5688479305824816 0.5689918983334776 0.6308030513994181;
         0.9844519526932385 0.05957039918524343 0.16920598873503145 0.26466787431210026 0.3273430016867569 0.4490502773732654 0.6726433619983658],
        "f(x)"   => +Inf,
        "gamma"  => rand(),
        "y"      => [0.5886430110085807 0.32914238645718963 0.2888520521840012 0.26968674730017794 0.27465218034535255 0.4459822389240827 0.6034776156707196;
         0.5489756852899045 0.6774563889771498 0.6117937125809438 0.6957514636660374 0.1363090899378463 0.519717627394074 0.8835443097850474;
         0.874187543238049 0.24314229392781217 0.20193146854590316 0.10594782088443547 0.4873420015660753 0.5935040655910679 0.6835493401730847;
         0.8183028926081628 0.23998278025388683 0.2004676236930234 0.11402374950138522 0.45218188314537655 0.5590320254995675 0.6505724202640549],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndBallRank(3),
        "x"      => Complex{Float64}[0.2894901144233224 + 0.7901100704032158im 0.6756627927190222 + 0.17732824522289703im 0.4032334590351583 + 0.5586502215509941im 0.6765530083696047 + 0.9932602290818195im 0.6239659886851328 + 0.4722390586145797im;
                         0.9584404572720246 + 0.3400250643041498im 0.2817204876721717 + 0.1672398933443462im 0.12128240130180257 + 0.4551933013068352im 0.009961310207793783 + 0.7338453218632623im 0.6212643707424914 + 0.9635158606442724im;
                         0.24433751578157148 + 0.9730339027739963im 0.561280208357009 + 0.633283020406419im 0.7756547213943652 + 0.6363562132601082im 0.524463206504971 + 0.4679827241988874im 0.8880524015305997 + 0.7435744407640921im;
                         0.269826028779663 + 0.9982313659183581im 0.41546528075221145 + 0.6214520195056343im 0.8504698227465424 + 0.2768665057621147im 0.8444300571451868 + 0.03191011411950728im 0.03554939244925781 + 0.14138957996692292im;
                         0.2597821446989732 + 0.17685782088084867im 0.019472122622971932 + 0.06869500820139018im 0.25268066733355 + 0.9806451815396378im 0.48324598010201014 + 0.44249079773617583im 0.6889781312674093 + 0.7634231410250403im;
                         0.43816794443248064 + 0.6397332714961954im 0.46903438458543123 + 0.8824836781826655im 0.7497646614950952 + 0.36740503730557905im 0.3126961801169257 + 0.3291723529075903im 0.8244963378972998 + 0.008092801141097006im],
        "f(x)"   => +Inf,
        "gamma"  => rand(),
        "y"      => Complex{Float64}[0.3585122350782503 + 0.7204931620772194im 0.6873338530452431 + 0.2610974701292823im 0.39252783201763075 + 0.6238384834518138im 0.700958438487958 + 0.9854327001665436im 0.5535168614106272 + 0.44685210138441234im;
                         0.8350120893298553 + 0.3426664307287768im 0.4178136548191302 + 0.12698832094230983im 0.07358671256699245 + 0.47861707516508023im 0.002816461229650763 + 0.6363648374894336im 0.6956352575477227 + 1.0157211189866961im;
                         0.4135468294332672 + 0.9576574664510645im 0.4469496743511391 + 0.715289225146536im 0.7730346403491004 + 0.687733965182209im 0.5363213279663741 + 0.5318375665022115im 0.7965680634261025 + 0.6450297581065603im;
                         0.18649674078077969 + 1.095680382782847im 0.44917829901846035 + 0.5101097836542252im 0.824251628465519 + 0.2737731007006557im 0.7934464219269162 - 0.008707537347000721im 0.13522586261104846 + 0.137751277271351im;
                         0.27744885345156756 + 0.22735326748520787im -0.09129603800027204 + 0.0806859574437441im 0.23111156369091165 + 0.8472792964657452im 0.5259959290489749 + 0.5120663051072597im 0.7236832860052391 + 0.7728579942500509im;
                         0.3176634693027552 + 0.6443692910531424im 0.506476440217625 + 0.7834437422168772im 0.8489778225663775 + 0.2954271540742297im 0.27758349592855164 + 0.34110887017651426im 0.8565371173527224 + 0.09997874104615029im],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => NuclearNorm(1.0),
        "x"      => Float64[
          1.0  2.0  3.0;
          4.0  5.0  6.0;
          7.0  8.0  9.0 ],
        "f(x)"   => 17.916472867168920,
        "gamma"  => 1.0,
        "y"      => Float64[
          1.586052850795247   1.944185442781408   2.302318034767569;
          3.944185442781405   4.720927213907027   5.497668985032647;
          6.302318034767567   7.497668985032650   8.693019935297732 ],
        "f(y)"   => 15.916472867168915,
      ),

  Dict( "f"      => IndPSD(),
        "x"      => Symmetric(Float64[
          1.0  2.0  3.0  2.0;
          2.0  2.0  6.0  2.5;
          3.0  6.0  3.0  1.5;
          2.0  2.5  1.5  1.0 ]),
        "f(x)"   => +Inf,
        "gamma"  => 1.0,
        "y"      => Symmetric(Float64[
          1.6410947195520720 2.3777145021117252 2.5281090002887159 1.4927448378285653;
          2.3777145021117252 3.9278061374789126 4.2522683130214816 1.9740014117486595;
          2.5281090002887159 4.2522683130214816 4.6140313368981438 2.0691378959547362;
          1.4927448378285653 1.9740014117486600 2.0691378959547362 1.4316113417275229 ]),
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndPSD(),
        "x"      => Float64[1.0, 2.0, 3.0, 2.0, 2.0, 6.0, 2.5, 3.0, 1.5, 1.0],
        "f(x)"   => +Inf,
        "gamma"  => 1.0,
        "y"      => Float64[1.6410947195520720, 2.3777145021117252, 2.5281090002887159, 1.4927448378285653,
                            3.9278061374789126, 4.2522683130214816, 1.9740014117486600,
                            4.6140313368981438, 2.0691378959547362,
                            1.4316113417275229],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndPSD(scaling=true),
        "x"      => Float64[1.0, 2.0sqrt(2), 3.0sqrt(2), 2.0sqrt(2), 2.0, 6.0sqrt(2), 2.5sqrt(2), 3.0, 1.5sqrt(2), 1.0],
        "f(x)"   => +Inf,
        "gamma"  => 1.0,
        "y"      => Float64[1.6410947195520720, 2.3777145021117252sqrt(2), 2.5281090002887159sqrt(2), 1.4927448378285653sqrt(2),
                            3.9278061374789126, 4.2522683130214816sqrt(2), 1.9740014117486600sqrt(2),
                            4.6140313368981438, 2.0691378959547362sqrt(2),
                            1.4316113417275229],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndBallL1(3.5),
        "x"      => [0.183227263001437, -1.029767543566621, 0.949221831131023, 0.307061919146703,
            0.135174942099456, 0.515246335524849, 0.261406324055383, -0.941485770955434,
            -0.162337672803828, -0.146054634331526, -0.532011376808821, 1.682103594663179,
            -0.875729346160017, -0.483815050110121, -0.712004549027422, -1.174212331456816,
            -0.192239517539275, -0.274070229932602, 1.530072514424096, -0.249024742513714,
            -1.064213412889327, 1.603457298120044, 1.234679146890778, -0.229626450963180,
            -1.506159703979719, -0.444627816446985, -0.155941035724769, 0.276068253931536,
            -0.261163645776479, 0.443421912904091],
        "f(x)"   => +Inf,
        "gamma"  => 1.0,
        "y"      => [   0.0000000000000000e+00, -1.0823022875891708e-01, 2.7684516323319142e-02, 0.0000000000000000e+00,
            0.0000000000000000e+00, 0.0000000000000000e+00, 0.0000000000000000e+00, -1.9948456147730109e-02,
            -0.0000000000000000e+00, -0.0000000000000000e+00, -0.0000000000000000e+00, 7.6056627985547520e-01,
            -0.0000000000000000e+00, -0.0000000000000000e+00, -0.0000000000000000e+00, -2.5267501664911218e-01,
            -0.0000000000000000e+00, -0.0000000000000000e+00, 6.0853519961639224e-01, -0.0000000000000000e+00,
            -1.4267609808162318e-01, 6.8191998331234005e-01, 3.1314183208307422e-01, -0.0000000000000000e+00,
            -5.8462238917201514e-01, -0.0000000000000000e+00, -0.0000000000000000e+00, 0.0000000000000000e+00,
            -0.0000000000000000e+00, 0.0000000000000000e+00],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndExpPrimal(),
        "x"      => [0.537667139546100, 1.833885014595086, -2.258846861003648],
        "f(x)"   => +Inf,
        "gamma"  => 2*rand(),
        "y"      => [-2.331395211405815e-01, 2.108704992310933e-01, 6.980034791326437e-02],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndExpPrimal(),
        "x"      => [8.621733203681206e-01, 3.187652398589808e-01, -1.307688296305273e+00],
        "f(x)"   => +Inf,
        "gamma"  => 2*rand(),
        "y"      => [0.0, 0.0, 0.0],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndExpPrimal(),
        "x"      => [-4.335920223056836e-01, 3.426244665386499e-01, 3.578396939725760e+00],
        "f(x)"   => 0.0,
        "gamma"  => 2*rand(),
        "y"      => [-4.335920223056836e-01, 3.426244665386499e-01, 3.578396939725760e+00],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndExpPrimal(),
        "x"      => [-2.049660582997746e-01, -1.241443482163119e-01, 1.489697607785465e+00],
        "f(x)"   => +Inf,
        "gamma"  => 2*rand(),
        "y"      => [-2.049660582997746e-01, 0, 1.489697607785465e+00],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndExpPrimal(),
        "x"      => [0.7647528861899316, -0.20198832835175584, 0.9528202307304982],
        "f(x)"   => +Inf,
        "gamma"  => 2*rand(),
        "y"      => [0.30504984970236265,0.1688454299327435,1.0283026364773413],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndNonnegative(),
        "x"      => [0.7647528861899316, 0.20198832835175584, 0.0],
        "f(x)"   => 0.0,
        "gamma"  => 2*rand(),
        "y"      => [0.7647528861899316, 0.20198832835175584, 0.0],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndNonnegative(),
        "x"      => [0.7647528861899316, -0.20198832835175584, 0.0],
        "f(x)"   => Inf,
        "gamma"  => 2*rand(),
        "y"      => [0.7647528861899316, 0.0, 0.0],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndNonpositive(),
        "x"      => [-0.7647528861899316, -0.20198832835175584, 0.0],
        "f(x)"   => 0.0,
        "gamma"  => 2*rand(),
        "y"      => [-0.7647528861899316, -0.20198832835175584, 0.0],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndNonpositive(),
        "x"      => [-0.7647528861899316, 0.20198832835175584, 0.0],
        "f(x)"   => Inf,
        "gamma"  => 2*rand(),
        "y"      => [-0.7647528861899316, 0.0, 0.0],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndZero(),
        "x"      => [-0.0, 0.0],
        "f(x)"   => 0.0,
        "gamma"  => 2*rand(),
        "y"      => [0.0, 0.0],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndZero(),
        "x"      => [-0.01, 0.0],
        "f(x)"   => Inf,
        "gamma"  => 2*rand(),
        "y"      => [0.0, 0.0],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndSOC(),
        "x"      => [1., 2.],
        "f(x)"   => Inf,
        "gamma"  => 2*rand(),
        "y"      => [1.5, 1.5],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndSOC(),
        "x"      => [2., 1.],
        "f(x)"   => 0.0,
        "gamma"  => 2*rand(),
        "y"      => [2., 1.],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndRotatedSOC(),
        "x"      => [1., 1., 2.],
        "f(x)"   => Inf,
        "gamma"  => 2*rand(),
        "y"      => [1/2*(1+sqrt(2)), 1/2*(1+sqrt(2)), 1/2*(2+sqrt(2))],
        "f(y)"   => 0.0,
      ),

  Dict( "f"      => IndRotatedSOC(),
        "x"      => [1., 1., 1.],
        "f(x)"   => 0.0,
        "gamma"  => 2*rand(),
        "y"      => [1., 1., 1.],
        "f(y)"   => 0.0,
      )
]

for i = 1:length(stuff)

  println("----------------------------------------------------------")

  f = stuff[i]["f"]
  x = stuff[i]["x"]

  println(string(typeof(f), " on ", typeof(x)))

  ref_fx = stuff[i]["f(x)"]
  gamma = stuff[i]["gamma"]
  ref_y = stuff[i]["y"]
  ref_fy = stuff[i]["f(y)"]

  fx = 0.0

  try
    fx = call_test(f, x)
  catch e
    if isa(e, MethodError)
      println("(not defined)")
      continue
    end
  end

  @test fx == ref_fx || abs(fx-ref_fx)/(1+abs(ref_fx)) <= TOL_ASSERT
  y, fy = prox_test(f, x, gamma)
  @test vecnorm(y-ref_y, Inf)/(1+norm(ref_y, Inf)) <= TOL_ASSERT

  if ProximalOperators.is_prox_accurate(f)
    @test fy == ref_fy || abs(fy-ref_fy)/(1+abs(ref_fy)) <= TOL_ASSERT
  end

end
