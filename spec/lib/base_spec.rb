require "spec_helper"

describe QuickExport do
	describe "get_csv_extension" do
		it "should be csv for Base class" do
			expect(ActiveRecord::Base.get_csv_extension).to eq(".csv")
		end
	end
	describe "get_xls_extension" do
		it "should be xls for Base class" do
			expect(ActiveRecord::Base.get_xls_extension).to eq(".xls")
		end
	end

	describe "#generate_random_filename" do
		it "generates a file of length 30" do
			filename = ActiveRecord::Base.generate_random_filename
			expect(filename.size).to eq(30)
		end
		it "should not generate the same filename on subsequent calls" do
			first_filename = ActiveRecord::Base.generate_random_filename
			second_filename = ActiveRecord::Base.generate_random_filename
			expect(first_filename).not_to eq(second_filename)
		end
	end	

	describe "#build_filename" do
		it "should generate csv extension if given true csv attribute" do
			filename = ActiveRecord::Base.build_filename(true)
			expect(filename[-3..-1]).to eq("csv")
		end
		it "should generate xls file if given false csv attribute" do
			filename = ActiveRecord::Base.build_filename(false)
			expect(filename[-3..-1]).to eq("xls")
		end
		it "should generate csv extension if csv attribute is not given" do
			filename = ActiveRecord::Base.build_filename(true)
			expect(filename[-3..-1]).to eq("csv")
		end
	end
end