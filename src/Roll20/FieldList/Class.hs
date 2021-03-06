module Roll20.FieldList.Class ( FieldList(..) ) where

import GHC.TypeNats ( KnownNat )

-- | An instance means that @fs@ is the homogeneous vector composed of elements
--   of type @f@ and of length @n@. Or, more simply, @fs@ is a @n@-element
--   tuple where every element is of type @f@.
--
--   These instances are largely generated by Template Haskell, and therefore
--   must technically be orphans. As it is not possible to import the class
--   without all of these instances, it is unlikely to pose a problem in
--   practice.
class (KnownNat n) => FieldList fs f n | f n -> fs, fs f -> n, fs n -> f where
        fieldList :: fs -> [f]

instance FieldList f f 1 where
    fieldList = pure
