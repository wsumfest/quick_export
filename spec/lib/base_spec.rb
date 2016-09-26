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
	end	
end