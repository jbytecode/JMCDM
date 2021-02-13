function euclidean(v1::Array{Float64,1}, v2::Array{Float64,1})::Float64 
    (v1 .- v2).^2.0 |> sum |> sqrt
end

function euclidean(v1::Array{Float64,1})::Float64
    v2 = zeros(Float64, length(v1))
    return euclidean(v1, v2)
end

function normalize(v1::Array{Float64,1})::Array{Float64,1}
    return v1 ./ euclidean(v1) 
end

function normalize(data::DataFrame)::DataFrame
    df = copy(data)
    _, p = size(df)
    for i in 1:p
        df[:, i] = normalize(data[:, i])
    end
    return df
end

function apply_columns(fs::Array{Function,1}, data::Union{DataFrame,Array{T,2}} where T <: Number)
    _, m = size(data)
    return [fs[i](data[:,i]) for i in 1:m]
end

function apply_columns(f::Function, data::Union{DataFrame,Array{T,2}} where T <: Number)
    return [f(c) for c in eachcol(data)]
end

function colmins(data::DataFrame)::Array{Float64,1}
    return apply_columns(minimum, data)
end

function colmaxs(data::DataFrame)::Array{Float64,1}
    return apply_columns(maximum, data)
end

function colsums(data)::Array{Float64,1}
    return apply_columns(sum, data)
end

function colmeans(data)::Array{Float64,1}
    return apply_columns(mean, data)
end

function apply_rows(f::Function, data::Union{DataFrame,Array{T,2}} where T <: Number)
    return [f(c) for c in eachrow(data)]
end

function rowmins(data::DataFrame)::Array{Float64,1}
    return apply_rows(minimum, data)
end

function rowmaxs(data::DataFrame)::Array{Float64,1}
    return apply_rows(maximum, data)
end

function rowsums(data)::Array{Float64,1}
    return apply_rows(sum, data)
end

function rowmeans(data)::Array{Float64,1}
    return apply_rows(mean, data)
end

function mean(v)::Float64
    return sum(v) / length(v)
end

function unitize(v::Array{Float64,1})::Array{Float64,1}
    return v ./ sum(v)
end

function Base.:*(w::Array{Float64,1}, data::DataFrame)::DataFrame
    newdf = copy(data)
    _, p = size(newdf)
    for i in 1:p
        newdf[:, i] = w[i] .* data[:, i]
    end
    return newdf
end

function Base.:-(r1::DataFrameRow, r2::DataFrameRow)::Array{Float64,1}
    v1 = convert(Array{Float64,1}, r1)
    v2 = convert(Array{Float64,1}, r2)
    return v1 .- v2
end

function Base.:-(r1::Array{Float64,1}, r2::DataFrameRow)::Array{Float64,1}
    v2 = convert(Array{Float64,1}, r2)
    return r1 .- v2
end


function makeDecisionMatrix(mat::Array{T,2} where T <: Number)::DataFrame
    _, m = size(mat)
    df = DataFrame()
    for i in 1:m
        name = string("Crt", i)
        df[:,Symbol(name)] = convert(Array{Float64,1}, mat[:, i])     
    end
    return df
end

function Base.minimum(df::DataFrame)
    df |> x -> convert(Matrix, x) |> minimum
end