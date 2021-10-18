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

RSpec.shared_examples_for 'a yes/no form control' do |input_selector:,elem_selector:|
  context 'when yes is chosen' do
    before do
      within input_selector do
        choose 'Yes'
      end
    end

    it 'shows the toggled element' do
      expect(page).to have_selector(:css, elem_selector)
    end
  end

  context 'when no is chosen' do
    before do
      within input_selector do
        choose 'No'
      end
    end

    it 'hides the toggled element' do
      expect(page).not_to have_selector(:css, elem_selector)
    end
  end
end

RSpec.shared_examples_for 'a yes/no/unknown form control' do |input_selector:,elem_selector:|
  context 'when yes is chosen' do
    before do
      within input_selector do
        choose 'Yes'
      end
    end

    it 'shows the toggled element' do
      expect(page).to have_selector(:css, elem_selector)
    end
  end

  context 'when no is chosen' do
    before do
      within input_selector do
        choose 'No'
      end
    end

    it 'hides the toggled element' do
      expect(page).not_to have_selector(:css, elem_selector)
    end
  end

  context 'when unknown is chosen' do
    before do
      within input_selector do
        choose 'Unknown'
      end
    end

    it 'hides the toggled element' do
      expect(page).not_to have_selector(:css, elem_selector)
    end
  end

end

RSpec.shared_examples_for 'a checkbox form control' do |input_selector:,checkbox:,elem_selector:|
  context 'when chosen' do
    before do
      within input_selector do
        check checkbox
      end
    end

    it 'shows the toggled element' do
      expect(page).to have_selector(:css, elem_selector)
    end
  end

  context 'when no is chosen' do
    before do
      within input_selector do
        uncheck checkbox
      end
    end

    it 'hides the toggled element' do
      expect(page).not_to have_selector(:css, elem_selector)
    end
  end
end


RSpec.shared_examples_for 'a radio form control' do |input_selector:,chosen_value:,elem_selector:|
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
