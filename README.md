# Well, just make it easy

## Link rc & alias to current directory

```bash
ln -s $(pwd)/.*rc ~/
ln -s $(pwd)/.*alias* ~/
```

> Same, but overwrite existing (ln -sf)

```bash
ln -sf $(pwd)/.*rc ~/
ln -sf $(pwd)/.*alias* ~/
```
