require File.expand_path(File.join(File.basename(__FILE__), '../lib/filedesc'))

describe FileDescription do
  before :all do
    @file = File.new(File.expand_path(File.join(File.dirname(__FILE__),"amq.pdf")))
  end
  
  it "should get mime type with charset" do
    @file.mime.should == "application/pdf; charset=binary"
  end

  it "should detect mime type by string" do
    @file.is_a_mime?("application/pdf; charset=binary").should be(true)
  end
  
  it "should detect mime type by regexp" do
    @file.is_a_mime?(/pdf/).should be(true)
  end
  
  it "should get description properly" do
    @file.description.should == "PDF document, version 1.3"
  end
  
  it "should match description with regexp" do
    @file.has_description?(/pdf.*1\.3/i).should be(true)
  end
  
  it "should get extension" do
    @file.extension.should == "pdf"
  end
  
  it "should get info properly" do
    props = @file.info
    
    props[:executable].should == false
    props[:mime].should == "application/pdf; charset=binary"
    props[:filename].should == "amq.pdf"
    props[:mode].should == 33188
    props[:path].should == "/Users/shairon/Projects/Community/filedesc/spec/amq.pdf"
    props[:directory].should == "/Users/shairon/Projects/Community/filedesc/spec"
    props[:description].should == "PDF document, version 1.3"
    props[:extension].should == "pdf"
    props[:size].should == 66012
    props[:uid].should == 501
    props[:last_access].day.should == Time.now.day

  end
  
end

