abstract type MCDMResult end 

struct TopsisResult <: MCDMResult
    decisionMatrix::DataFrame
    weights::Array{Float64,1}
    normalizedDecisionMatrix::DataFrame
    normalizedWeightedDecisionMatrix::DataFrame 
    bestIndex::Int64 
    scores::Array{Float64,1}
end

struct VikorResult <: MCDMResult
    decisionMatrix::DataFrame
    weights::Array{Float64,1}
    weightedDecisionMatrix::DataFrame
    bestIndex::Int64
    scores::Array{Float64,1}
end


struct ElectreResult <: MCDMResult
    decisionMatrix::DataFrame
    weights::Array{Float64,1}
    weightedDecisionMatrix::DataFrame
    fitnessTable::Array{Dict,1}
    nonfitnessTable::Array{Dict,1}
    fitnessMatrix::Array{Float64,2}
    nonfitnessMatrix::Array{Float64,2}
    C::Array{Float64,1}
    D::Array{Float64,1}
    bestIndex::Tuple
end


struct MooraResult <: MCDMResult
    decisionMatrix::DataFrame
    weights::Array{Float64,1}
    weightedDecisionMatrix::DataFrame
    referenceMatrix::DataFrame
    scores::Array{Float64,1}
    bestIndex::Int64
end


struct DematelResult <: MCDMResult
    comparisonMatrix::DataFrame
    NDMatrix::Array{Float64,2}
    relationShipMatrix::Array{Float64,2}
    c::Array{Float64,1}
    r::Array{Float64,1}
    c_plus_r::Array{Float64,1}
    c_minus_r::Array{Float64,1}
    threshold::Float64 
    influenceMatrix::Array{Float64,2}
    weights::Array{Float64,1}
end

struct AHPConsistencyResult <: MCDMResult
    comparisonMatrix::DataFrame
    normalizedComparisonMatrix::DataFrame
    consistencyVector::Array{Float64,1}
    pc::Array{Float64,1}
    lambda_max::Float64
    CI::Float64
    RI::Float64
    CR::Float64
    isConsistent::Bool
end