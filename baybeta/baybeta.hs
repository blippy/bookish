import Numeric

norm xs = map (\x -> x / sum xs ) xs

nbuckets = 11
pmf0 = norm [1.0::Double | _ <- [0..(nbuckets-1)]]

pvals = [fromIntegral i/ fromIntegral (len)  | i <-[0..len]] where len = length pmf0 -1
--pvals = [i/len  | i <-[0..len]] where len = length pmf0

                                                 
pass pmf = norm [ p * like | (p, like) <- zip pvals pmf ]

nopass pmf = norm [ (1.0-p) * like | (p, like) <- zip pvals pmf ]

pmf1 = (pass . pass . pass . pass . pass .  nopass . nopass . nopass) pmf0

-- nbuckets is the number of buckets to use, e.g. 101
beta alpha beta nbuckets =
  let ps = [ fromIntegral (i-1) / fromIntegral (nbuckets-1) | i <-[1..nbuckets]] in
  norm [ p ** (alpha-1) * (1-p) ** (beta-1) | p <- ps ]

beta53 = beta 5 3 nbuckets

main = do
  print pmf1
  let vs =  unlines $ map (\x -> showFFloat (Just 7) (x::Float) "") beta53
  putStrLn vs
