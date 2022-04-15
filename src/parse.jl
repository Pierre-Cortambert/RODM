using Random

function parse_red_wine(MyFileName::String)
  path = "../data/" * MyFileName
  # Si le fichier path existe
  if isfile(path)
    # L’ouvrir
    myFile = open(path)
    n = 200
    X = Array{Float64,2}(zeros(n,11))
    Y = Array{Int64,1}(zeros(n))
    for i in 1:n
      line =  split(readline(myFile), ";")
      Y[i] = parse(Int64,line[12])
      for j in 1:11
        X[i,j] = parse(Float64,line[j])
      end
    end
    # normalisation de X
    for i in 1:11
      X[:,i] .-= minimum(X[:,i])
      X[:,i] ./= maximum(X[:,i])
    end

    newfile = open("../data/red-wine-quality.txt", "w")
    println(newfile, "X = ")
    println(newfile, X)
    println(newfile, "Y = ")
    println(newfile, Y)
    close(newfile)
  else
    println("No file")

  end

end

parse_red_wine("winequality-red.txt")

function parse_white_wine(MyFileName::String)
  path = "../data/" * MyFileName
  # Si le fichier path existe
  if isfile(path)
    # L’ouvrir
    myFile = open(path)
    n = 200
    X = Array{Float64,2}(zeros(n,11))
    Y = Array{Int64,1}(zeros(n))
    for i in 1:n
      line =  split(readline(myFile), ";")
      Y[i] = parse(Int64,line[12])
      for j in 1:11
        X[i,j] = parse(Float64,line[j])
      end
    end
    # normalisation de X
    for i in 1:11
      X[:,i] .-= minimum(X[:,i])
      X[:,i] ./= maximum(X[:,i])
    end

    newfile = open("../data/white-wine-quality.txt", "w")
    println(newfile, "X = ")
    println(newfile, X)
    println(newfile, "Y = ")
    println(newfile, Y)
    close(newfile)
  else
    println("No file")

  end

end

parse_white_wine("winequality-white.txt")
