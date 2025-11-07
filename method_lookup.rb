# ============================================================================
# RUBY METHOD LOOKUP ORDER EXAMPLE
# ============================================================================
# This file demonstrates how Ruby resolves method calls through its
# ancestry chain. When a method is called, Ruby searches in this order:
#
# 1. Singleton class (eigenclass) methods
# 2. Prepended modules (in reverse order of prepending)
# 3. The class itself
# 4. Included modules (in reverse order of including)
# 5. Parent class prepended modules
# 6. Parent class
# 7. Parent class included modules
# 8. Continue up the inheritance chain...
# 9. Object, Kernel, BasicObject
# 10. method_missing (if defined)
# ============================================================================

# ----------------------------------------------------------------------------
# PREPENDED MODULES for class A (searched BEFORE class A)
# Prepended modules are inserted ABOVE the class in the lookup chain
# ----------------------------------------------------------------------------
module O
  def greet
    p "Hello from prepended module O"
  end
end

module P
  def greet
    p "Hello from prepended module P"
  end
end

# ----------------------------------------------------------------------------
# INCLUDED MODULES for class A (searched AFTER class A)
# Included modules are inserted BELOW the class in the lookup chain
# ----------------------------------------------------------------------------
module Q
  def greet
    p "Hello from included module Q"
  end
end

module R
  def greet
    p "Hello from included module R"
  end
end

# ----------------------------------------------------------------------------
# PREPENDED MODULES for class B (searched BEFORE class B)
# ----------------------------------------------------------------------------
module S
  def greet
    p "Hello from prepended module S"
  end
end

module T
  def greet
    p "Hello from prepended module T"
  end
end

# ----------------------------------------------------------------------------
# INCLUDED MODULES for class B (searched AFTER class B)
# ----------------------------------------------------------------------------
module U
  def greet
    p "Hello from included module U"
  end
end

module V
  def greet
    p "Hello from included module V"
  end
end

# ----------------------------------------------------------------------------
# PREPENDED MODULES for class C (searched BEFORE class C)
# ----------------------------------------------------------------------------
module W            
  def greet            
   p "Hello from prepended module W"            
  end          
end            

module X            
  def greet            
   p "Hello from prepended module X"            
  end          
end            

# ----------------------------------------------------------------------------
# INCLUDED MODULES for class C (searched AFTER class C)
# ----------------------------------------------------------------------------
module Y            
  def greet            
    p "Hello from included module Y"            
  end            
end            

module Z            
  def greet            
    p "Hello from included module Z"            
  end            
end            

# ----------------------------------------------------------------------------
# CLASS A - Base class in the inheritance hierarchy
# ----------------------------------------------------------------------------
class A
  prepend O  # O will be searched BEFORE A
  prepend P  # P will be searched BEFORE O (most recent prepend is highest)
  include Q  # Q will be searched AFTER A
  include R  # R will be searched AFTER Q (most recent include is lowest)
  
  def greet            
    p "Hello from superclass A"            
  end            
end            

# ----------------------------------------------------------------------------
# CLASS B - Inherits from A
# ----------------------------------------------------------------------------
class B < A
  prepend S  # S will be searched BEFORE B
  prepend T  # T will be searched BEFORE S
  include U  # U will be searched AFTER B
  include V  # V will be searched AFTER U
  
  def greet            
    p "Hello from superclass B"            
  end            
end            

# ----------------------------------------------------------------------------
# CLASS C - Inherits from B (which inherits from A)
# ----------------------------------------------------------------------------
class C < B            
  prepend W  # W will be searched BEFORE C            
  prepend X  # X will be searched BEFORE W (most recent prepend wins)
  include Y  # Y will be searched AFTER C            
  include Z  # Z will be searched AFTER Y
  
  def greet            
    p "Hello from class C"            
  end

  # method_missing is called LAST if method isn't found anywhere
  def method_missing(name, *args)            
    p "Method '#{name}' is not defined"            
  end            
end            

# ----------------------------------------------------------------------------
# CREATING AN INSTANCE AND DEFINING A SINGLETON METHOD
# ----------------------------------------------------------------------------
o = C.new            

# Define a method on the singleton class (eigenclass) of object 'o'
# This is the FIRST place Ruby will look when calling o.greet
def o.greet            
  p "Hello from eigenclass"            
end

# ----------------------------------------------------------------------------
# METHOD CALL: o.greet
# ----------------------------------------------------------------------------
p o.greet # => "Hello from eigenclass"

# ----------------------------------------------------------------------------
# ANCESTRY CHAIN VISUALIZATION
# ----------------------------------------------------------------------------
# The ancestors method shows the full lookup chain:
#
# #<Class:#<C:0x...>>  ← Singleton class (eigenclass) of object 'o'
#          ↓
#          X           ← Prepended to C (last prepend, searched first)
#          ↓
#          W           ← Prepended to C (first prepend, searched second)
#          ↓
#          C           ← The class itself
#          ↓
#          Z           ← Included in C (last include, searched first)
#          ↓
#          Y           ← Included in C (first include, searched second)
#          ↓
#          T           ← Prepended to B (last prepend)
#          ↓
#          S           ← Prepended to B (first prepend)
#          ↓
#          B           ← Parent class
#          ↓
#          V           ← Included in B (last include)
#          ↓
#          U           ← Included in B (first include)
#          ↓
#          P           ← Prepended to A (last prepend)
#          ↓
#          O           ← Prepended to A (first prepend)
#          ↓
#          A           ← Grandparent class
#          ↓
#          R           ← Included in A (last include)
#          ↓
#          Q           ← Included in A (first include)
#          ↓
#        Object        ← Ruby's base object class
#          ↓
#        Kernel        ← Core Ruby methods (print, puts, etc.)
#          ↓
#     BasicObject      ← Root of Ruby's object hierarchy
#
p o.singleton_class.ancestors
# => [#<Class:#<C:0x00007f96a02933b0>>, X, W, C, Z, Y, T, S, B, V, U, P, O, A, R, Q, Object, Kernel, BasicObject]
