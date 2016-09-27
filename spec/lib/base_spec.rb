require "spec_helper"

describe QuickExport::Base do
	describe "get_file_extension" do
		it "should be nil for Base class" do
			expect(QuickExport::Base.get_file_extension).to be(nil)
		end
	end
	
	describe "#generate_random_filename" do
		it "generates a file of length 30" do
			filename = QuickExport::Base.generate_random_filename
			expect(filename.size).to eq(30)
		end
		it "should not generate the same filename on subsequent calls" do
			first_filename = QuickExport::Base.generate_random_filename
			second_filename = QuickExport::Base.generate_random_filename
			expect(first_filename).not_to eq(second_filename)
		end
	end	

	describe "#build_filename" do
		it "should not be implemented in Base class" do
			expect(QuickExport::Base.build_filename).to be(nil)
		end
	end
end