project "nuklear"
	kind "staticLib"
	language "C"
	staticruntime "on"
	tool()

	targetdir (engine_root .. "/lib/" .. outputdir)
	objdir (engine_root .. "/bin-int/" .. outputdir)

	files {
		"nuklear.h",
		"src/*.h",
		"src/*.c",
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
