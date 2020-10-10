## 3 Pascal triangle
Pascal_triangle <- function(k){
    for(kk in 0:k){
     print((choose(k,kk)))
    }
}
Pascal_triangle(100)
Pascal_triangle(200)
## 通过http://blog.sciencenet.cn/blog-54276-450738.html学习了函数"choose" 