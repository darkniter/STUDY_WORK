module Nat where
data Nat = Zero | Succ Nat
    deriving (Show, Eq, Ord)
instance Num Nat where
    (+) a Zero = a
    (+) a (Succ b) = if a>b then Succ (a+b) else Succ (b+a)

    (*) a Zero = Zero
    (*) a (Succ b) = a + (a*b)

    fromInteger 0 = Zero
    fromInteger n = Succ (fromInteger (n-1))

    abs x       = x
    signum Zero = Zero
    signum _    = Succ Zero
    negate _ = error "negate is undefined for Nat" 