module Functions where
    
    import Nat
    import BinTree

    beside_tmp :: Nat -> Nat -> Bool
    beside_tmp num1 num2 = if num2==(Succ num1)
                           then True
                           else False

    beside :: Nat -> Nat -> Bool
    beside num1 num2 = if num1<num2
                       then beside_tmp num1 num2
                       else beside_tmp num2 num1

    inc::Integer -> Nat
    inc inc_tmp = fromInteger (inc_tmp - 1)

    beside2 :: Nat -> Nat -> Integer -> Bool
    beside2 num1 num2 num3 = if num1<num2
                             then beside_tmp (num1+(inc num3)) num2 
                             else beside_tmp (num2+(inc num3)) num1

    intoInteger ::Nat->Integer
    intoInteger Zero        = 0
    intoInteger (Succ Zero) = 1
    intoInteger (Succ a)    =  intoInteger (a) + 1

    boolStr::Bool->String
    boolStr x = if x
                    then "True"
                    else "False"

    toString::Nat->String
    toString Zero = "Zero"
    toString (Succ Zero) = "Succ Zero"
    toString (Succ a) = "Succ" ++ (toString a)

    pow::Nat->Nat->Nat
    pow num1 num2 = fromInteger ((intoInteger num1)^(intoInteger num2))

    treeList :: (Ord a) => [a] -> BinTree a
    treeList [] = Empty
    treeList (x:xs) = Node x ( 
                                (treeList (filter (<x) xs)),
                                (treeList (filter (>x) xs))
                             )

    reverse_ovrd :: BinTree a -> BinTree a
    reverse_ovrd (Node a (ls, rs)) = Node a (rs,ls)

    

    -- depth_tmp::BinTree a -> Nat -> Nat
    -- depth_tmp Node a (Empty,Empty)
    -- comp_depth::Nat->Nat->Nat
    -- comp_depth ls rs = if depth_tmp ls > depth_tmp rs
    --                         then True
    --                         else False

    -- depth :: BinTree a -> Nat
    -- depth Node a (ls, rs) = 