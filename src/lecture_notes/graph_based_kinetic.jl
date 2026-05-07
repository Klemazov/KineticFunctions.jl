### A Pluto.jl notebook ###
# v0.20.24

using Markdown
using InteractiveUtils

# ╔═╡ 197d06a8-4974-11f1-8921-e7312541442d
begin
	import Pkg;
	Pkg.activate("..//..");
	using Graphs;
	using Plots;
	using PlutoUI;
	using StaticArrays;
	
end;

# ╔═╡ 82aeed7d-48f3-4c51-9c29-4390db965b86
Pkg.status()

# ╔═╡ 7bdd4686-3269-47c1-8f63-7abb4b05b988
PlutoUI.TableOfContents()

# ╔═╡ 8a912fcb-3f71-4283-89e8-d062e092a647
md"""
# type experiments
"""

# ╔═╡ 2cb09f1d-2c57-4416-87f5-2627c973efc8
begin
	# concentration models F = (a^n)
	abstract type AbstractKineticModel{N} end
	struct KineticModel{P} <: AbstractKineticModel{1}
		params::MVector{1,P}
		names::NTuple{1, Symbol}
	end


	
	# arrhenius model K = Aexp(-E/T)
	abstract type AbstractRateModel{N} end
	struct RateModel{P} <: AbstractRateModel{2}
		params::MVector{2,P}
		names::NTuple{2, Symbol}
	end
	

	#K*F
	abstract type AbstractReactionModel{N} end


	struct ReactionModel{G, K, F, T} <: AbstractReactionModel{N}
		graph_model::G
		kinetic_rates::K
		kinetic_models::F
		temperature::T
	end

	
	
end

# ╔═╡ Cell order:
# ╠═197d06a8-4974-11f1-8921-e7312541442d
# ╠═82aeed7d-48f3-4c51-9c29-4390db965b86
# ╠═7bdd4686-3269-47c1-8f63-7abb4b05b988
# ╟─8a912fcb-3f71-4283-89e8-d062e092a647
# ╠═2cb09f1d-2c57-4416-87f5-2627c973efc8
