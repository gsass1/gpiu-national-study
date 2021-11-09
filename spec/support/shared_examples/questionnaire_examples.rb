# frozen_string_literal: true

RSpec.shared_examples_for 'a questionnaire' do |name:|
  context 'when patient is unlocked' do
    before do
      patient.update(locked: false)
      visit current_path
    end

    it 'can be saved' do
      click_button 'Submit'

      expect(page).to have_content("Updated #{name} form")
    end
  end

  context 'when patient is locked' do
    before do
      patient.update(locked: true)
      visit current_path
    end

    it 'cannot be saved' do
      expect(page).to have_button('Submit', disabled: true)
    end
  end
end

RSpec.shared_examples_for 'a yes/no form control' do |input_selector:, elem_selector:|
  it 'toggles the target selector' do
    within input_selector do
      choose 'Yes'
    end
    expect(page).to have_selector(:css, elem_selector)

    within input_selector do
      choose 'No'
    end
    expect(page).not_to have_selector(:css, elem_selector)
  end
end

RSpec.shared_examples_for 'a yes/no/unknown form control' do |input_selector:, elem_selector:|
  it 'toggles the target selector' do
    within input_selector do
      choose 'Yes'
    end
    expect(page).to have_selector(:css, elem_selector)

    within input_selector do
      choose 'No'
    end
    expect(page).not_to have_selector(:css, elem_selector)

    within input_selector do
      choose 'Unknown'
    end
    expect(page).not_to have_selector(:css, elem_selector)
  end
end

RSpec.shared_examples_for 'a checkbox form control' do |input_selector:, checkbox:, elem_selector:|
  it 'toggles the target selector' do
    within input_selector do
      check checkbox
    end
    expect(page).to have_selector(:css, elem_selector)

    within input_selector do
      uncheck checkbox
    end
    expect(page).not_to have_selector(:css, elem_selector)
  end
end

RSpec.shared_examples_for 'a radio form control' do |input_selector:, chosen_value:, elem_selector:|
  context 'when chosen' do
    before do
      within input_selector do
        choose chosen_value
      end
    end

    it 'shows the toggled element' do
      expect(page).to have_selector(:css, elem_selector)
    end
  end

  context 'when not chosen' do
    # Assumes nothing is chosen by default

    it 'hides the toggled element' do
      expect(page).not_to have_selector(:css, elem_selector)
    end
  end
end
