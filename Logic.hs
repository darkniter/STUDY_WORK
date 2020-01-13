module Logic where
import Prelude(Bool(..),Eq(..),Show(..))

true::Bool
true = True
false::Bool
false = False

not::Bool->Bool
not True = False
not False = True

and::Bool->Bool->Bool
and False _ = False
and True x = x


or::Bool->Bool->Bool
or False x = x
or True _ = True