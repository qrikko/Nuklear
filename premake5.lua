project "nuklear"
	kind "staticLib"
	language (engine.compiler.language)
	cdialect (engine.compiler.dialect)
	toolset (engine.compiler.toolset)

	targetdir (engine.lib)
	objdir (engine.intermediate)

	staticruntime "on"

	files {
		"nuklear.h",
		"src/**.h",
		"src/**.c",
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "system:linux"
		systemversion "latest"
		-- should these be removed?
		buildoptions { "-fPIC" }

		defines {
			"NK_IMPLEMENTATION",
		}

	filter "system:windows"
		systemversion "latest"

		defines {
			"NK_IMPLEMENTATION",
		}
