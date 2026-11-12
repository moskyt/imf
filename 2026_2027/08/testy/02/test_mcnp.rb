require "minitest/autorun"

require_relative "lib/mcnp_output_file"

class TestMcnp < Minitest::Test
  def test_read
    fn = "./c1_1o"
    o = MCNPOutputFile.new(fn)
    assert_in_delta 1.00353, o.keff
  end
end

