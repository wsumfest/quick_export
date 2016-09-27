require "spec_helper"

describe ActiveRecord::Base do
	it "should include QuickExport modules" do
		expect(ActiveRecord::Base.build_filename).not_to be(nil)
	end
end

describe ActiveRecord::Relation do
	it "should include QuickExport modules" do
		puts "not implemented"
	end
end