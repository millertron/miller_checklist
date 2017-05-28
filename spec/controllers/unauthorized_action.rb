shared_examples "an unauthorized action"
	expect(response.status).to eq :unauthorized
	expect(controller).to render_template("unauthorized")
end