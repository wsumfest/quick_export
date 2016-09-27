require "spec_helper"

describe QuickExport::To_XLS do
	describe "#get_file_extension" do
		it "should be .xls for XLS class" do
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

	describe "#build_filename" do
		it "should be implemented in XLS class" do
			expect(QuickExport::To_XLS.build_filename).not_to be(nil)
		end
		it "should have the .xls extension in the XLS class" do
			mock_filename = QuickExport::To_XLS.build_filename
			expect(mock_filename[-4..-1]).to eq(".xls")
		end
	end
end