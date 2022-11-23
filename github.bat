git checkout main
git pull github main
del .gitignore
copy .gitignore-github .gitignore
git add *
git commit -am "-"
git push github main
