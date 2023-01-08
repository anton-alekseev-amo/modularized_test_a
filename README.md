# Modularized Test App
This is a test project created for the modularization test purposes. The app structure is defined in the next diagram.

App Structure
---
```mermaid
graph BT
subgraph  App Workspace
	A[App Module]
	subgraph  Internal Dependencies
		B[Module A]
		C[Module B]
		subgraph Module with Nested Modules
			C1[Module B Additional module]
		end
		D(Shared Module)
	end
	subgraph External Dependencies
		E{{3rd party dependencies Module}}
		F((pod 1))
		G((pod 2))
		H((pod n))
	end
end
A --> B & C
C --> C1
A & B & C --> D
A & B & C --> E
E --> F & G & H
```