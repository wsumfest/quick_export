require "spec_helper"

describe QuickExport::To_XLS do
	describe "#get_file_extension" do
		it "should be nil for Base class" do
			expect(QuickExport::To_XLS.get_file_extension).to eq(".xls")
		end
	end

	describe "#generate_random_filename" do
		it "generates a file of length 30" do
			filename = QuickExport::To_XLS.generate_random_filename
			expect(filename.size).to eq(30)
		end
		it "should not generate the same filename on subsequent calls" do
			first_filename = QuickExport::To_XLS.generate_random_filename
			second_filename = QuickExport::To_XLS.generate_random_filename
			expect(first_filename).not_to eq(second_filename)
		end

	end


end