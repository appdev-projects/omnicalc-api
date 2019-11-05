require "rails_helper"

describe "/flexible/square/[ANY INTEGER]" do
  it "should have a working RCAV.",  points: 1 do
    visit "/flexible/square/3"

    expect(page.status_code).to be(200)
  end
end

describe "/flexible/square/[ANY INTEGER]" do
  it "should display the Integer from the URL.",  points: 1 do
    visit "/flexible/square/3"

    expect(page).to have_content(3)
  end
end

describe "/flexible/square/[ANY INTEGER]" do
  it "should display the square of the Integer from the URL.",  points: 1 do
    visit "/flexible/square/3"
    
    expect(page).to have_content(9)
  end
end

describe "/flexible/square/[ANY INTEGER]" do
  it "should display the Integer and the square of the Integer in JSON.",  points: 2 do
    visit "/flexible/square/42"
    
    json_result = { :number => 42, :square => 1764 }.to_json

    expect(page).to have_content(json_result)
  end
end

describe "/flexible/square_root/[ANY INTEGER]" do
  it "should have a working RCAV.",  points: 1 do
    visit "/flexible/square_root/9"

    expect(page.status_code).to be(200)
  end
end

describe "/flexible/square_root/[ANY INTEGER]" do
  it "should display the Integer from the URL.",  points: 1 do
    visit "/flexible/square_root/9"
    
    expect(page).to have_content(9)
  end
end

describe "/flexible/square_root/[ANY INTEGER]" do
  it "should display the square root of the Integer from the URL.",  points: 1 do
    visit "/flexible/square_root/1764"
    
    expect(page).to have_content(42.0)
  end
end

describe "/flexible/square_root/[ANY INTEGER]" do
  it "should display the Integer and the square of the Integer in JSON.",  points: 2 do
    visit "/flexible/square_root/1764"

    json_result = { :number => 1764, :square_root => 42.0 }.to_json

    expect(page).to have_content(json_result)
  end
end

describe "/flexible/random/[MIN]/[MAX]" do
  it "should have a working RCAV.",  points: 1 do
    visit "/flexible/random/1/5"
    expect(page.status_code).to be(200)
  end
end

describe "/flexible/random/[MIN]/[MAX]" do
  it "should display the Min and Max Integers from the URL.",  points: 1 do
    visit "/flexible/random/50/100"
    
    expect(page).to have_content(50)
    expect(page).to have_content(100)
  end
end

describe "/flexible/random/[MIN]/[MAX]" do
  it "should display a random number between the min and max from the URL in JSON.",  points: 2 do
    visit "/flexible/random/50/100"
    
    require("json")
    
    json_body = JSON.parse(page.body)
    random_number = json_body.fetch("random")
    
    expect(page).to have_content(50)
    expect(page).to have_content(100)

    expect(random_number).to be_between(50, 100)
  end
end
