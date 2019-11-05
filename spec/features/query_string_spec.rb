require "rails_helper"

describe "/square/results" do
  it "should have a working RCAV.", points: 1 do
    visit "/square/results?input_number=9"

    expect(page.status_code).to be(200)
  end
end

describe "/square/results" do
  it "should display the input_number from the query string of the URL.", points: 1 do
    visit "/square/results?input_number=5"

    expect(page).to have_current_path("/square/results?input_number=5", ignore_query: false)
    p page.current_url
    expect(page).to have_content(5)
  end
end

describe "/square/results" do
  it "should display the square of the input_number from the query string of the URL.", points: 1 do
    visit "/square/results?input_number=5"

    expect(page).to have_content(25)
  end
end

describe "/square/results" do
  it "should display the input_number and the square of the input_number in JSON.", points: 2 do
    visit "/square/results?input_number=7"
    
    json_result = { :number => 7, :square => 49 }.to_json

    expect(page.body).to have_content(json_result)
  end
end

describe "/random/results" do
  it "should have a working RCAV.", points: 1 do
    visit "/random/results?input_min=5&input_max=10"

    expect(page.status_code).to be(200)
  end
end

describe "/random/results" do
  it "should display the input_min and input_max and the square of the input_number in JSON.", points: 1 do

    visit "/random/results?input_min=1&input_max=100"

    require("json")
    
    json_body = JSON.parse(page.body)
    random_number = json_body.fetch("random")

    expect(random_number).to be_between(1, 100)
  end
end

describe "/square_root/results" do
  it "should have a working RCAV.", points: 1 do
    visit "/square_root/results?input_number=90"

    expect(page.status_code).to be(200)
  end
end

describe "/square_root/results" do
  it "should display the input_number from the query string of the URL.", points: 1 do
    visit "/square_root/results?input_number=16"
    
    expect(page).to have_content(16)
  end
end

describe "/square_root/results" do
  it "should display the square root of the input_number from the query string of the URL.", points: 1 do
    
    visit "/square_root/results?input_number=1764"
    
    expect(page).to have_content(42.0)
  end
end

describe "/square_root/results" do
  it "should display the input_number and the square root of the input_number in JSON.", points: 1 do
    
    visit "/square_root/results?input_number=1764"
    
    json_result = { :number => 1764, :square_root => 42.0 }.to_json
    
    expect(page).to have_content(json_result)
  end
end

describe "/payment/results" do
  it "should have a working RCAV.", points: 1 do
    visit "/payment/results?input_apr=4.10&input_years=20&input_pv=1000"
    
    expect(page.status_code).to be(200)
  end
end

describe "/payment/results" do
  it "should display the input_apr, input_years, and input_pv from the query string of the URL.", points: 1 do
    visit "/payment/results?input_apr=4.10&input_years=20&input_pv=1000"
    
    expect(page).to have_content(4.10)
    expect(page).to have_content(20)
    expect(page).to have_content(1000)
  end
end

describe "/payment/results" do
  it "calculates and displays the monthly payment.", points: 2 do
    visit "/payment/results?input_apr=4.10&input_years=20&input_pv=1000"
    
    expect(page).to have_content(6.11)
  end
end

describe "/payment/results" do
  it "calculates the correct monthly payment and displays the input_apr, input_years, input_pv and in JSON.", points: 3 do

    visit "/payment/results?input_apr=4.35&input_years=30&input_pv=235000"

    json_result = {
      :purchase_price => 235000,
      :apr => 4.35,
      :years => 30,
      :monthly_payment => 1169.86
    }.to_json

    expect(page).to have_content(json_result)
  end
end
