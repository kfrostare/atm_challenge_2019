require './lib/atm.rb'
describe ATM do
    let(:account) { instance_double('Account') }

    before do
        #Before each test we need to add an attribute of `balance`
        #to the `account` object set the value to `100` 
        allow(account).to receive(:balance).and_return(100)
        # We also need to allow `account` to receive a new balance
        # Using the setter method `balance=`
        allow(account).to receive(:balance=)
    end

    it 'has 1000$ on initialize' do 
        expect(subject.funds).to eq 1000
    end
    it 'funds are reduced at withdraw' do
        subject.withdraw(50, account)
        expect(subject.funds).to eq 950
    end

    it 'allow withdraw if the account has enough balance.' do
        expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
        expect(subject.withdraw(45, account)).to eq expected_output
    end
end
