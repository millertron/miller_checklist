shared_examples "an unauthorized action" do |response|
	it "should be an unauthorized action" do
		expect(response).to have_http_status(:unauthorized)
		expect(response).to render_template("unauthorized")
	end
end