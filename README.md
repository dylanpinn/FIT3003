# FIT3003: Business Intelligence and Data Warehousing

## Lectures

- [Lecture 1](/lectures/lecture-01.md)
- [Lecture 2](/lectures/lecture-02.md)
- [Lecture 3](/lectures/lecture-03.md)
- [Lecture 4](/lectures/lecture-04.md)

## Tutorials

## Working locally with notes

Build files changed into HTML documents

```bash
ls lectures/*.md | entr find ./lectures -iname "*.md" -type f -exec sh -c 'pandoc --katex -s "${0}" -o "./build/$(basename ${0%.md}.html)"' {} \;
```

Watch changed HTML documents and reload browser.

```bash
npx browser-sync start -s -f . --host $LOCAL_IP --port 9000
```
