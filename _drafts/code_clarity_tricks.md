# Returning Conditional Expression results

Let's say you run into a block of code that returns true or false based on some condition. For example:

```ruby
def is_retired?(client) do
  if client.age >= client.retirement_age do
    true
  else
    false
  end
end
```

This code can be simplified:

```ruby
def is_retired?(client) do
  client.age >= client.retirement_age
end
```

Since the value that should be returned matches the value of what the condition evaluates to, it's unnecessary to make this extra congnitive leap.
