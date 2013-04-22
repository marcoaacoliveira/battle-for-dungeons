libs = [

	File.expand_path('../../lib', __FILE__),
	File.expand_path('../../app', __FILE__)
]


$LOAD_PATH.unshift *Dir.glob(libs)

require "battle_for_dungeons"

@characters = [Berserker.new(:name => "Adrian", :strength => 2, :skill => 1, :armor => 3 )]
