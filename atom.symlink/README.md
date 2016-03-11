Install the Atom packages by running:

```
apm install --packages-file ~/.atom/package-list.txt
```

If you add or update an Atom package, update the `package-list.txt` file:

```
apm list --installed --bare > ~/.atom/package-list.txt
