<?php
    require_once('panggil-database.php');
?>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>PROUD - SMK NAKA</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-eduwell-style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    
    
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<!--

TemplateMo 573 EduWell

https://templatemo.com/tm-573-eduwell

-->
  </head>

<body>


  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <nav class="main-nav">
                      <!-- ***** Logo Start ***** -->
                      <a href="index.php" class="logo">
                          <img src="dist/img/logo.png" width="50" height="50" alt="EduWell Template">
                      </a>
                      <!-- ***** Logo End ***** -->
                      <!-- ***** Menu Start ***** -->
                      <ul class="nav">
                          <li class="scroll-to-section"><a href="#top" class="active">Utama</a></li>
                          <li class="scroll-to-section"><a href="#">RPH</a></li>
                          <li class="scroll-to-section"><a href="#services">Pentadbiran</a></li>
                          <li class="scroll-to-section"><a href="#courses">Bidang</a></li>
                          <li><a href="kehadiranKo/kehadiran-ko.php">Kehadiran Ko</a></li>
                          <li><a href="kehadiran/kehadiran-harian.php">Kehadiran</a></li>
                          <li class="has-sub">
                              <a href="javascript:void(0)">Menu</a>
                              <ul class="sub-menu">
                                  <li><a href="kuri.html">Kurikulum</a></li>
                                  <li><a href="hem.html">H.E.M</a></li>
                                  <li><a href="koko.html">Kokurikulum</a></li>
                                  <li><a href="t6.html">T Enam</a></li>
                                  <li><a href="ppki.html">PPKI</a></li>
                              </ul>
                          </li>
                          <li class="scroll-to-section"><a href="#contact-section">Hubungi</a></li> 
                      </ul>        
                      <a class='menu-trigger'>
                          <span>Menu</span>
                      </a>
                      <!-- ***** Menu End ***** -->
                  </nav>
              </div>
          </div>
      </div>
  </header>
  <!-- ***** Header Area End ***** -->

  <!-- ***** Main Banner Area Start ***** -->
  <section class="main-banner" id="top">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="header-text">
            <h6>Selamat Datang Ke</h6>
            <h2><em>S</em>ekolah <em>M</em>enengah <em>K</em>ebangsaan <em>N</em>aka</h2>
            <div class="main-button-gradient">
              <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">Log Masuk Warga SMKN</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="login-proses.php" method="post">
                <div class="card-body">
                  <div class="form-group">
                    <label for="login">No ID</label>
                    <input type="text" class="form-control" name="login" placeholder="No ID anda">
                  </div>
                  <div class="form-group">
                    <label for="password1">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Katalaluan">
                  </div>
                 </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-info">Daftar Masuk</button>
                </div>
              </form>
            </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="right-image">
            <img src="dist/img/logo.png"  alt="logo sekolah">
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ***** Main Banner Area End ***** -->

  <section class="services" id="services">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading">
            <h6>Pentadbiran</h6>
            <h4>Barisan<em> Pengurusan</em></h4>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="owl-service-item owl-carousel">
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/631449adca25d.png" alt="">
                </div>
                <h4>PENGETUA</h4>
                <p>En. Fauzi bin Zakaria</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/avatardefault.png" alt="">
                </div>
                <h4>PK KURIKULUM</h4>
                <p>Mohd Nazeri bin Mahmood</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/62b86a9fc7250.jpg" alt="">
                </div>
                <h4>PK HEM</H4>
                <p>En. Azizan bin Abd Hamid</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/62b869628f1a6.jpg" alt="">
                </div>
                <h4>PK KOKU</h4>
                <p>En. Sukeri bin Din</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/62b872a969296.jpg" alt="">
                </div>
                <h4>PK PPKI</h4>
                <p>En. Nasir bin Ahmad</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/62b8765cd5aa0.jpg" alt="">
                </div>
                <h4>PK T.ENAM</h4>
                <p>En. Ramli bin Talib</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/62b868cc2ae96.jpg" alt="">
                </div>
                <h4>PK PETANG</h4>
                <p>En. Abdullah bin Sulong</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/62b8743251106.jpg" alt="">
                </div>
                <h4>GKSM</h4>
                <p>En. Noordin bin Ahmad</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/62b86e54491ba.jpg" alt="">
                </div>
                <h4>GKTV</h4>
                <p>En. Md Jelani bin Noh</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/62b87135a579c.jpg" alt="">
                </div>
                <h4>GK KEMANUSIAAN</h4>
                <p>Mohd Shukri bin Mohd Shuib</p>
              </div>
            </div>
            <div class="item">
              <div class="service-item">
                <div class="icon">
                  <img src="dist/img/profile/avatardefault.png" alt="">
                </div>
                <h4>GK BAHASA</h4>
                <p>En. Jamaludin bin Awang</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="our-courses" id="courses">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 offset-lg-3">
          <div class="section-heading">
            <h6>GURU BIDANG</h6>
            <h4>Guru-guru matapelajaran <em>Bidang</em></h4>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="naccs">
            <div class="tabs">
              <div class="row">
                <div class="col-lg-3">
                  <div class="menu">
                  <div class="active gradient-border"><span>Makluman</span></div>
                    <div class="gradient-border"><span>Sains & Matematik</span></div>
                    <div class="gradient-border"><span>Kemanusiaan</span></div>
                    <div class="gradient-border"><span>Teknik & Vokasional</span></div>
                    <div class="gradient-border"><span>Bahasa</span></div>
                    <div class="gradient-border"><span>PPKI</span></div>

                  </div>
                </div>
                <div class="col-lg-9">
                  <ul class="nacc">
                  <li class="active">
                      <div>
                        <div class="left-image">
                          <img src="#" alt="">
                        </div>
                        <div class="middle-content">
                            <marquee behavior="scroll" direction="up" scrollamount="2"
                                onmouseover="this.stop();"
                                onmouseout="this.start();">
                                  <?php
                                      $query = mysqli_query($sambung, "SELECT *
                                                                        FROM makluman 
                                                                        WHERE id_status=1");
                                      while ($result = mysqli_fetch_array($query)) {
                                          echo "<h4 class='mt-4'>Info : " . $result['maklumat'] . "</h4>";
                                      }
                                  ?>
                            </marquee>

                              
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="left-image">
                          <img src="#" alt="">
                        </div>
                        <div class="right-content">
                          masukkan content di sini
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="left-image">
                           <img src="#" alt="">
                        </div>
                        <div class="right-content">
                          masukkan content di sini
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="left-image">
                           <img src="#" alt="">
                        </div>
                        <div class="right-content">
                          masukkan content di sini
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="left-image">
                          <img src="#" alt="">
                        </div>
                        <div class="right-content">
                          masukkan content di sini
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="left-image">
                          <img src="#" alt="">
                        </div>
                        <div class="right-content">
                          masukkan content ppki di sini
                        </div>
                      </div>
                    </li>

                    </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="contact-us" id="contact-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div id="map">
          
            <!-- You just need to go to Google Maps for your own map point, and copy the embed code from Share -> Embed a map section -->
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.939660593699!2d100.66304605300718!3d6.138808817782597!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31b4ad783b961e0b%3A0xb81c2b76c2a3d5df!2sSMK%20Naka!5e0!3m2!1sen!2smy!4v1675653522482!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>            <div class="row">
              <div class="col-lg-4 offset-lg-1">
                <div class="contact-info">
                  <div class="icon">
                    <i class="fa fa-phone"></i>
                  </div>
                  <h4>Telefon</h4>
                  <span>04-785 1517</span>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="contact-info">
                  <div class="icon">
                    <i class="fa fa-envelope"></i>
                  </div>
                  <h4>Email</h4>
                  <span>info@smknaka.net</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <form id="contact" action="" method="post">
            <div class="row">
              <div class="col-lg-12">
                <div class="section-heading">
                  <h6>Hubungi Kami</h6>
                  <h4>Apa <em>Khabar?</em></h4>
                  <p>Jika anda mempunya sebarang pertanyaan dan cadangan, sila isi borang ini.</p>
                </div>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <input type="name" name="name" id="name" placeholder="Nama Anda" autocomplete="on" required>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <input type="text" name="email" id="email" placeholder="email anda - Jika ada" >
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <textarea name="message" id="message" placeholder="Mesej anda"></textarea>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <button type="submit" id="form-submit" class="main-gradient-button">Hantar Mesej</button>
                </fieldset>
              </div>
            </div>
          </form>
        </div>

        <div class="col-lg-12">
          <p class="copyright">Proud SMKN 2023. 
        </div>
      </div>
    </div>
  </section>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/video.js"></script>
    <script src="assets/js/slick-slider.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
</body>

</html>