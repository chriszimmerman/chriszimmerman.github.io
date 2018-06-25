# TDD, A Form of Deliberation In Programming

Deliberation
    -the act of thinking about or discussing something and deciding carefully

Writing a failing test first makes you think about the inputs and the outputs of a test. This makes you empathetic toward the caller of the method you're testing. You most likely don't want to have to go through the work of a complicated setup in order to test the method you want to write, so you'll make the interface simple. As a by-product, anyone else who consumes this interface will have an easier time interacting with it as well.

## Understanding what happens

Writing tests and predicting what will happen is a great exercise in measuring your understanding of the code.

For example, let's say I have the following test case:

```csharp
public class AccountMapperTest
{
    [Test]
    public void MapAccount_Maps_Api_Representation_Of_Account_To_Internal_Representation()
    {
        var apiAccount = new ApiAccount {
            Balance = 2000
        };

        var subject = new AccountMapper();

        var result = subject.MapAccount(apiAccount);

        Assert.That(result.Balance, Is.EqualTo(apiAccount.Balance))
    }
}
```

Along with the following classes:

```csharp
public class ApiAccount
{
    public long Balance { get; set; }
}

public class Account
{
    public Money Balance { get; set; }
}

public class AccountMapper
{
    public Account MapAccount(ApiAccount apiAccount)
    {
        return null;
    }
}
```
