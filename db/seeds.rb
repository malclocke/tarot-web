def fixture_file(*path)
  Rails.root.join('spec', 'fixtures', *path)
end

def fits_fixture(*path)
  File.open(fixture_file(*path))
end

Reference.create!   :filename => fits_fixture('references', 'NGC1365.fit')
NightImage.create!  :filename => fits_fixture('NGC1365.fit'),
                    :night  => Date.today
