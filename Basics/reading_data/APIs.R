## Reading from Github API 

library(httr)
library(jsonlite)

oauth_endpoints("github")

access_test_app = oauth_app("github",key = "29bb4ea5478c3dbc4323", secret = "edc722fc5f17fe2aaa71b7737fff029c6461a637")

github_token <- oauth2.0_token(oauth_endpoints("github"), access_test_app)

gtoken <- config(token = github_token)

req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
git_json = content(req)

gitDF = fromJSON(toJSON(git_json))

gitDF[gitDF$full_name == 'jtleek/datasharing', "created_at"]
