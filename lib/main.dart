import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signalapp/pages/news.dart';
import 'package:signalapp/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(duration: 3, goToPage: MyHomePage(title: '',),)
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Material(
      child: Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
             decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://techcrunch.com/wp-content/uploads/2017/04/gettyimages-528771760.jpg?w=680'),
          fit: BoxFit.cover
        ) ,
      ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 170.0,
                        child: ClipOval(
                          child: Image.network('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAilBMVEX///8AAAD6+vr39/fq6ur09PTi4uLx8fHe3t7t7e0+Pj7X19fT09NVVVX29vbv7++bm5u7u7vLy8uMjIwtLS2srKzFxcWVlZV9fX02NjYeHh5lZWWdnZ2wsLBKSkqGhoYoKChvb29ZWVkXFxd1dXVMTEwrKysSEhJpaWlDQ0M6OjoVFRVWVlYLCwsDRwpNAAAQGklEQVR4nO1d13biMBSMjektNNNDDyEJ//97i602kq4EJATYczQPu8FVo3KbruSXl4CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgB8hzf+tP7gUN0Yp7c3F39NV/t/wQxzoNh5QohsibsyaURStxM9mNMr/mEVrfqiwjPqLTvEhpfs1ksE0yjHiB9oH8fdrFO34wdZndkmt1yg8pJA/R2n2FnFs+aHk/fRjkf95YhjtOKX2mF32vu0+pqg/wlzSUwTb+S/FMDqIE3tx6aRXekhxr0VpEQGm4ij72ct/DPO/a/xUFS6vdR5S5mvQWCM/OdxKXzZDebKOd/QHTy130qbGLxrH7HhyjJBhj/8SEjXVbtq8xo8p/XnUazq/qM+bI5FHhvlvwVBSHBg3zh5D4AxKH0Yxo33CzlQnBkM1UoUc6hm3bp5vPMZDk18UcXul+KkOveZHQBYN+f1T8+bmk5l23b5NUNhqBzjGGI7sqwr2AxaPoUIitjootI4mfNgAQ4YRM8ZhrEocn8Zo7W4IgsIY3WpHZ8SxCn8K8ZDFc0jVBVE0qSde9cOD/OBKOzbh9hsxkqPPJ7ByigeiYFHExWhqHKYYRt/8UYYyZZjTr70fGiS/iAv7unmcMTSHLZcpZaq3S9fkQTBVtV7kqlVk1iKWauANRQ3Fk95oPYhcBlNRcwi3we52DoZRyfe85eMG44om6Ckv671r63ifP3FMP/BB2j8mJUMkBpslZRTDb/sEH23WwOVIH8KQFqLSJSRUuGBIVQ2XTZTKgNP3ROwieCyzC96ok6wtdtSpKrvN9E/0O+9J0FUSf2OkbvJv7L6S67n3pkgMJQbu8jkGFIs20c3Phy9pIql774WVqxiisy19pXS0P7ODYlLvZ7in0nDWs/DOXRcwb+GTPslFVMf17En5bgQdlkwk42cOW04wdGg9YdrY6pJjfC9Xw1l+OVacYsjPMGIMKs7Hf7iKdFuU3QR5P5s5L2AMiYAAA7dnt67zdwpRuRRhJGRF230BY+gQQ5EQJp46vIdAdVjbGVg0lDCsDYYT5/n1uXd8tf+cIGVtCrBh5BmmZxlyvV7cOy+YOkt2I8Tud4vYE2mTaQy/3Bdwx8tlnkbSMPgzrNyvPrJ4i1OdZWBu0NFzBTP6yp6KTP6UoK+PMjkXOwWlYui7Ysle5Bnta7poN8J8Nnt9HQ6HvQyLHKPRdrv6mE6nzOLo9Guf4/77crLZE03VOMuQq32POH18cMqFuFAsc5Verzca3W43TdNOhvkJA4bZjI+zwanqRttVVnfrdXO3ezucao5V3fKp598CAgICAgICAv4E3dV2NFr0esPh62xAR3oa3UajXq9USqUnmJG9HvPzNi14CxDPg8D1cb+ZLJf98fizdnjbNZvr9XT6scqqbnSyzJk/0c3q8HV2sjsHAysUEZcSBbuaY1+MrZCkvenb+ORVTw7T0axiGa0awy/yGTWSoWvmyQLz+HD289N8Q2pfDxj0s4o71dz3ummmZ1QWpre2WRsP0BjyfJeLGPpceYIhukx7M11WC85Z09pYl1W98HTYcjnDRjeiu1RY+ZcMU7ucZktoMeCm+X4494bHS56oHwwEgyGVF0AzJCeQPAyxncxYi9bTTPcPJ3kwXuqJ5USYimNG6Cs2Q5hmgJd7KpBkiJHslf4CY0bNCMRgCUGYjyI/DtT9GYhoHQThf8HwBYJLB/0FXfoGDgy/qqPuySEBkaBrzbLYUWWaoXNuwsUQY/V6Mxlhp552Mn5XZ1Qyn3viQKHpuLT/YuKXDEWVzYljditF5vwL9m7ZumSSgIWhozIstQ9yABg6JgHdDHG0DfH5BWMeY6m9HStGvt6cONitRtu1HcdMaIZ7w4LACCikJwHDCb+w0Cq3q0lSKlUwmiblL4xcbbRbDaIlQW2Ju/Q59J6Ujt2V/qAmzVCvYG0gHOHd0HcnLxcBpR8et6Lk2IdjqEmpZHDgNjUjoK1zrNMMDTkQq060pxkuL2OYOl5hxbdR6+FqDKkrYKrfEMuGkbZwMNTVPgyTL5qhLZxIYG/EwS6snaYIkm/hJDSwNGexk9ruDlLsxw6xq6n9lmI4AYMSGI4vY4jiF5O4xbGOeOQGTi6Ie6AzUJMYK2DS0Bgqy1EzDYtqug8Zgvy5lCHYWe/qqJSxiUzSgXtAG8rhCTqcmvZGoT3Q0pTTmv2wE8qK4ZJmWLNeQgNtFyWwRT9cqvZSlnkBbpEHoV3JfDdwChZavXZV66MHhwxBkQBDa7S7AMVVdSjKu1ZjTpUbhqHqkJBjTPrsK3V+qgmyFDwcsP7bSnL1gSF0n4sZgpekXiDUwUxJECXqoHiKDKgdw4ZnqLAJLT6TBY/ogpCCEVdVk9LIEAyRN+ItJGDQS+0dq9fLNlZVBvJM5Sig33Q+oU9jCO2v1H5VOQVjmuGOeC4JkAFSw8haLSg+sn5hohQGjqbyyLAEAkZtV0uFkcZWouZyPxXDGNvwZKq1y8VCrMN+Gd4kFJko7v4Fup9QVyCbwNIysj1G/iRp6NOZBFMdQPZwYFgDhp6UEY7j12Yy1sMiYGSaTtUW2MqT0B+RhvmmWq/hzuozGLZUwUU9gikCaqFwnmEGI58Q+pfQ3yIakoke2WOFi6hE3wTNcSInabOeOZrSYAjaVEhnYAhC80KGS50hDET+eDnK69g4XA7BGhPNaXTk9k2mcyIVBfoNqwNly6dWqUBoFp2JrjpDI6ykjIojOyObLR8AQtT0C/pJU7W7c/uiUceIVa5Mhpba/xXDd2PBC3QZNgqEAtnpp5lLBAaX3jhtZwJnhlWKb7UYgs0zNxmCWih7UrcAfYMhGM0DjZPYT4KDmTxKeZmGYeIfJJOF8hrBAuKiBTq5yRAs8rYnLwsZGl0GFBzjJLotq03ZLXOLOlYXW1qv6MmAzLEVrQ4XCuGpelLPzbB6GUMrcVkN82X2syV+MfUo9fHWqGtCTqbenhpJvwMYCh0MwjPR3wPeWNWXfqfQNxmChstOCZXOJZJcxpF7V+Al2QRf7OX/Jnb5EAFjWLrLqhRbJ0OwA6LvzMbNMt6ylLc8641nu31MtyZDsFIyWS0GnugdctBoPzSvH1HxB4bfDIZSXMGSh7rGEEJkGJLo2a92Q902AxLiEVJ6NrRLPcueGguP0MkMM2hoJZCV6dG8OcMpPluSEGaabOK5JgD8iywbs7VLdzU0hhCWU4M4RbULDDFUcBVD5UEdTxJR/C1GiHzsCOv5fEppuTEkFypNNY8fksTVaFkiQzCdnBHsc4AbK1I9qtiTCB18oqo+6yHlKHRGtvgr4zQgmpCqLw2gSOBR/5gh7J7QkQ2qGgmiUSqKQEz5OVCZGbMNHQy1owmpBt8SpJ+D4WVVLKCaZiT5qJCZlOMV9YbrVgN1tbnbHjLUzA+l9mGkAkM0769jqIbXTgYKVCxCmnWpMvBcusIFnD7YYZRWq6liROAmDFXbTGT3UK+WMnqoVJ0Ri6nz7J4kSRw7hAGpMU4h6VdRwXCozJ8zBEEtuiRO7YhzTaWpDQ8MVLhDAoCjPcFglnEZoUhvw1B1oo39XCn6jtLwNQNd0AkdGy6A+D9iYNe4jFgasiUfcu2KMvvB/hQLM3MDrnBE+cAc2XgYEvkkt2EYW89FbWDzNyMTeAWdaQfBuAOGrs3r7G0qbsPQXmGJA82aEbbmX3GA0Au9IDbwgYFd60LLyYRujwxf45Y3uc6E2RG1vma1sL2bEiZJUDY5rprqoTyxrrSq08Ewx/GE/X7/tdlMJsvlO8tUzDPurPiXuX5Plxem02env2g1ZFMs17S7fQyttBwoim+VoQHL5jKbSS+k8dKj7VfowcQPY1Jei/lPtClxm6G5vupGDM3ur1+gZ0uSq5vNBJxOhVVDuZSO9NSVhbbakXiUofZ/xtCWd/pjl3orGeFeakVlNTKxHNcOtU9bhSdathnxKGM1IQz6XzHUSRhKzYjikfrgkqSvDFkEDzwq6lG6droVQ33/OdOB1jJXHTPo52KJDLkuOcNQT0G8FUN9LyxzknPloy9wSRJ2M1dhcIB8kqYV4HVXMCRmS7SuYdaAli7pXIB/PnOQe0LnGGrVDQzpfbkuZajlzJonG76TCsZmdxaE35El2dWzPLuGY5fCZJGv+M3XrILiqu/W3/ni1UMtX77aXy4nk80XtfiXWnwNUu/bPId7MviW31d8idgfN1wbkk1oFwqtVqtYLJ/QbrerJ3gXUJy66UyumbZzDT6abNlvv7/37w/VdQmc1f+0sbQf1Ve7IXfz59hQ8naod3qjafPtbbeerl7T/3LlUkBAQEBAQMBd0Ui7XbnsOUmqWcblo8t0W3j3gGLmUhrhquedXPWcrRjniaCzbOW4XPY8mM+zpOU0ZXXHaqwgzfaTEd9uZxZ9sVhstQoFMm/1hlh5GPIwlW/1LPMUfGvCeNaJkZl33H/lUdh+VnPjP90Kq0WXi4G92ecaM0fJtzaTdQTnNq0ZrpzpuhZzz6v5rIYnSMQYeuIPPBDk3P0yunxxx49BfQZBgKWreBrgLEMWOXXtCJ3jz72j8pkMpBffGmTmebvHIY/++obyX2+59+IfZyzUY88PXsiQJ1n7JDa5guTW8MS4dmeKyBg6sybZ/IW5aBaxvI/69YgSHjhySQo/Qx7+8+0kcHnq0K9AfBNG1jG7wiVsvJvs8vbxLdO+287siTt7lseMHTMnXoY8DdgTrv9jTYjwhPR5P6K1OiNBdwHeRz0K99rUqF/BLe68m8d7GPL7PH30b3f1tODe0nvgucDDkCtytxS7eJHj31NM3GVlXfidOMOXT7r7aO3+bpqTIleK1KIaxpDQd3yIufvo4REfm3HONPMEIkIc5V0xthmKxeBOr+PuXZTB2aW4PLVVt4sh79jOzYOtjZXuBZeJKnJ6LdMmZ2Kv6+Pza85tmO+qJnTUHcu7uLtfNmVKzrBlMuS92rmS6o6K3kbZMXK4eWVqxZxh0WAoWsg1o/vorZ8dziBXb0bHy9c7GB8fa/oftLyTse0BrTXEii7d1crXO+gMPwu+x0TTZ4hW0hvDkd8/zPNI2zh4j1yMOizdZ/nkKrmATBQOF+vk7aWtXOS9uU16K7XnmbGuU4EJ4czBubzL4cpF7jERKjK6cinOn4MKbfDil1Xxc4bgXYqcEMonXD9PAzIktqU94UvFlM5gV1qtvCIIPt8HgU/CwoqDim00JMX8V2KSIIy1Z/1wdcfkKD88jgzFD0HQtuAXj/xq5Rl0DM0hUpjrNkNB0FKEw7/9CMmv0dXNbZE33TAZimw200GZORZrPROSBSo8kbBZ1xlS20VG0fdjvlV5PeIU5m9kmudRMTyKDQQwonUYPpt+8KI6X8l+xw+VvhjDSjQx9xc6mS/Dx1vY16PbY1E14d8ljGFd7sojCK7m9/vu360Rd1/XYzkWGY+ykCWzbJPxUed/bDwDSZfUb6Vht/L/tl1AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAwAPwD3eT5ko9LHgIAAAAAElFTkSuQmCC'),
                            
                          
                        )),
                    ElevatedButton(
        onPressed: () {
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => wallpaperPage('')));
        },
        child: Text(
          'Apple Stock News',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(15),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
                    
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  } 
}      