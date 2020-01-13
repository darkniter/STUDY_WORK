module Beside where
    import Nat
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

