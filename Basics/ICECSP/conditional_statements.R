## To check if a number is even 
checkEven = function(x){
  if(x%%2 == 0){
    print("Is even")
  }else
    print("Is not even")
}

## To check if a given object is a matrix 
isMatrix = function(x){
  if(is.matrix(x)){
    print("Is a matrix")
  }else
    print("Is not a matrix")
}

## To print a vector of length 3 descending order 
order_vec_length3 = function(x){
  if(x[1]>x[2]){
    if(x[1]>x[3]){
      print(x[1])
      if(x[3]>x[2])
        print(x[3])
        print(x[2])
    }else{
      print(x[3])
      print(x[1])
      print(x[2])
    }
  }else{
    if(x[2]>x[3]){
      print(x[2])
      if(x[3]>x[1])
        print(x[3])
      print(x[1])
    }else{
      print(x[3])
      print(x[2])
      print(x[1])
    }
  }
}

## To print max element in numeric vector of length 3 
maxelement_vec_length3 = function(x){
  if(x[1]>x[2]){
    if(x[1]>x[3]){
      print(x[1])
    }else{
      print(x[3])
    }
  }else{
    if(x[2]>x[3]){
      print(x[2])
    }else{
      print(x[3])
    }
  }
}

