module FixtureHelpers
  def fixture_filename(*arguments)
    Rails.root.join('spec', 'fixtures', *arguments)
  end
end
