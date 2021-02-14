module JMcDM

using DataFrames
using LinearAlgebra
using JuMP
using Cbc

# includes 
include("types.jl")
include("utilities.jl")
include("topsis.jl")
include("vikor.jl")
include("electre.jl")
include("moora.jl")
include("dematel.jl")
include("ahp.jl")
include("nds.jl")
include("singlecriterion.jl")
include("game.jl")
include("dataenvelop.jl")
include("grey.jl")
include("saw.jl")
include("aras.jl")
include("wpm.jl")
include("waspas.jl")
include("edas.jl")
include("marcos.jl")

# export MCDM types
export MCDMResult
export TopsisResult
export VikorResult
export ElectreResult
export MooraResult
export AHPConsistencyResult
export AHPResult
export NDSResult
export GreyResult
export SawResult
export ARASResult
export WPMResult
export WASPASResult
export EDASResult
export MARCOSResult

# export game type
export GameResult

#  export SCDM types
export SCDMResult
export LaplaceResult
export MaximinResult
export MaximaxResult
export MinimaxResult
export MiniminResult
export SavageResult
export HurwiczResult
export MLEResult
export ExpectedRegretResult
export DataEnvelopResult


# export utility functions
export euclidean
export normalize
export colmaxs
export colmins
export unitize
export makeDecisionMatrix

#  export MCDM tools
export topsis 
export vikor
export electre
export moora 
export dematel
export ahp_RI, ahp_consistency, ahp
export nds
export grey
export saw 
export aras
export wpm
export waspas
export edas
export marcos

#  export SCDM tools
export laplace
export maximin
export maximax
export minimax
export minimin
export savage
export hurwicz
export mle
export expectedregret

# export game solver
export game

# export data envelop
export dataenvelop


end # module
