module Select
(
  Select,
  Selector,
  create,
  selector,
  from
)
where

import BoundSource (BoundSource)
import Column (Column)
import From (From)

type Selector = [BoundSource] -> [Column]

data Select =
  Select Selector From
  deriving Show

create :: Selector -> From -> Select
create ff f = Select ff f

selector :: Select -> Selector
selector (Select ff _) = ff

from :: Select -> From
from (Select _ f) = f

