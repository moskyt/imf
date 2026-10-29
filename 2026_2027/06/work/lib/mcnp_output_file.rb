class MCNPOutputFile

    attr_reader :keff, :keff_error

    def initialize(filename)
        @filename = filename
        read
    end

    def read
        File.foreach(@filename) do |line|
            if line.include?("the final estimated combined collision/absorption/track-length keff")
                line = line.split("=")[1].strip.split
                @keff, @keff_error = line[0].to_f, line[-2].to_f
                break
            end
        end
    end
end