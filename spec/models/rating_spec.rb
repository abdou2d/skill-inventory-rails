describe Rating do
  it "is valid" do
    rating = build(:rating)

    expect(rating).to be_valid
  end

  it "is invalid without a user" do
    rating = build(:rating, user: nil)

    expect(rating).to be_invalid
  end

  it "is invalid without a skill" do
    rating = build(:rating, skill: nil)

    expect(rating).to be_invalid
  end

  it "is invalid if score is not between 0 - 4" do
    rating = build(:rating, score: 5)

    expect(rating).to be_invalid
  end

  it "is invalid if skill and user for rating exists" do
    user = create(:user)
    skill = create(:skill)
    rating_1 = create(:rating, score: 4, user: user, skill: skill)
    rating_2 = build(:rating, score: 3, user: user, skill: skill)

    expect(rating_1).to be_valid
    expect(rating_2).to be_invalid
  end
end
