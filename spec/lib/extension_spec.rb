require "spec_helper"

describe ActiveRecord::Base do
	it "should include QuickExport modules in descendants" do
		expect(ActiveRecord::Base.build_filename).not_to be(nil)
	end

end