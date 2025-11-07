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

class A
  prepend O
  prepend P
  include Q
  include R
  
  def greet            
    p "Hello from superclass A"            
  end            
end            

class B < A
  prepend S
  prepend T
  include U
  include V
  
  def greet            
    p "Hello from superclass B"            
  end            
end            

class C < B            
  prepend W            
  prepend X
  include Y            
  include Z
  
  def greet            
    p "Hello from class C"            
  end

  def method_missing(name, *args)            
    p "Method '#{name}' is not defined"            
  end            
end            

o = C.new            

def o.greet            
  p "Hello from eigenclass"            
end

p o.greet # "Hello from eigenclass"

p o.singleton_class.ancestors # [#<Class:#<C:0x00007f96a02933b0>>, X, W, C, Z, Y, T, S, B, V, U, P, O, A, R, Q, Object, Kernel, BasicObject]
