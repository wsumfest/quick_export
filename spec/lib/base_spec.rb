require "spec_helper"

describe QuickExport::Base do
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
		it "should test the inheritance of To_CSV class" do
			filename = QuickExport::To_CSV.generate_random_filename
			expect(filename).not_to be(nil)
			expect(filename.size).to eq(30)
		end
		it "should test the inheritance of To_XLS class" do
			filename = QuickExport::To_XLS.generate_random_filename
			expect(filename).not_to be(nil)
			expect(filename.size).to eq(30)
		end
	end	
end