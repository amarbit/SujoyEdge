using Documenter, DemoCards
using Images, ImageFiltering, ImageSegmentation, ImageFeatures, PaddedViews
using ImageContrastAdjustment, TestImages, FileIO, MosaicViews, ImageMorphology

branch = "master"

templates, theme = cardtheme("grid")
demos, demos_cb = makedemos("examples", templates; branch = branch)

format = Documenter.HTML(edit_link = "source",
                         prettyurls = get(ENV, "CI", nothing) == "true",
                         assets = [theme])

makedocs(modules  = [Images, ImageCore, Colors, ColorTypes, FixedPointNumbers, ImageAxes,
                    ImageFeatures, ImageFiltering, ImageMetadata, ImageContrastAdjustment,
                    ImageDistances, ImageQualityIndexes, MosaicViews, TestImages, FileIO,
                    ImageSegmentation, ImageTransformations, PaddedViews, ImageMorphology],
         format   = format,
         sitename = "JuliaImages",
         pages    = ["Home" => "index.md",
                     "install.md",
                     "Tutorials" => Any[
                         joinpath("tutorials", "quickstart.md"),
                         joinpath("tutorials", "arrays_colors.md"),
                         joinpath("tutorials", "conversions_views.md"),
                         joinpath("tutorials", "indexing.md")
                     ],
                     "Packages" => Any[
                         "Introduction" => joinpath("pkgs", "index.md"),
                         "ImageAxes.jl" => joinpath("pkgs", "axes", "index.md"),
                         "ImageMetaData.jl" => joinpath("pkgs", "metadata", "index.md"),
                         "ImageSegmentation.jl" => joinpath("pkgs", "segmentation", "index.md"),
                         "ImageTransformations.jl" => joinpath("pkgs", "transformations", "index.md"),
                         "ImageFeatures.jl" => joinpath("pkgs", "features", "index.md")
                     ],
                     "Demos" => demos,
                     "References" => "function_reference.md",
                     "api_comparison.md",
                    #  "faqs.md"
                    ])

demos_cb()

deploydocs(repo      = "github.com/JuliaImages/juliaimages.github.io.git",
           target    = "build",
           branch    = branch,
           push_preview = true,
           devbranch = "source",
           deps      = nothing,
           make      = nothing)
