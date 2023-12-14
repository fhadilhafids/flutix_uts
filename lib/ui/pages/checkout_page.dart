part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;

  const CheckoutPage(this.ticket, {Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticket.seats.length;
    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToSelectSeatPage(widget.ticket));
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Container(
                color: accentColor1,
              ),
              SafeArea(
                  child: Container(
                color: Colors.white,
              )),
              ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: 20,
                                left: MediaQuery.of(context).size.width - 40),
                            padding: const EdgeInsets.all(1),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<PageBloc>()
                                    .add(GoToSelectSeatPage(widget.ticket));
                              },
                              child: const Icon(
                                Icons.cancel_sharp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) {
                          UserApp? user = (userState as UserLoaded).user;

                          return Column(children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Check details below\nbefore checkout",
                                style: blackTextFont.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 140,
                                  height: 180,
                                  margin: const EdgeInsets.only(
                                      left: defaultMargin, right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${imageBaseURL}w342${widget.ticket.movieDetail.posterPath}'),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2 * defaultMargin -
                                              140 -
                                              20,
                                          child: Text(
                                            widget.ticket.movieDetail.title,
                                            style: blackTextFont.copyWith(
                                                fontSize: 18),
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                          )),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                140 -
                                                20,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          widget.ticket.movieDetail
                                              .genresAndLanguage,
                                          style: greyTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      RatingStars(
                                        voteAverage: widget
                                            .ticket.movieDetail.voteAverage,
                                        color: accentColor3,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2 * defaultMargin -
                                              140 -
                                              20,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Cinema",
                                                style: greyTextFont.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                widget.ticket.theater.name,
                                                style: blackTextFont.copyWith(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                    ])
                              ],
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: defaultMargin),
                                child: const Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1,
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Order ID",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    widget.ticket.bookingCode,
                                    style: whiteTextFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: defaultMargin),
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Text("Cinema",
                            //           style: greyTextFont.copyWith(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w400)),
                            //       SizedBox(
                            //         width: MediaQuery.of(context).size.width *
                            //             0.55,
                            //         child: Text(
                            //           widget.ticket.theater.name,
                            //           textAlign: TextAlign.end,
                            //           style: whiteTextFont.copyWith(
                            //               color: Colors.black,
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w400),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 9,
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Date & Time",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    widget.ticket.time.dateAndTime,
                                    style: whiteTextFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Seat Number",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.seatsInString,
                                      textAlign: TextAlign.end,
                                      style: whiteTextFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const SizedBox(
                            //   height: 9,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: defaultMargin),
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Text("Price",
                            //           style: greyTextFont.copyWith(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w400)),
                            //       Text(
                            //         "IDR 25.000 x ${widget.ticket.seats.length}",
                            //         style: whiteNumberFont.copyWith(
                            //             color: Colors.black,
                            //             fontSize: 16,
                            //             fontWeight: FontWeight.w400),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 9,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: defaultMargin),
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Text("Fee",
                            //           style: greyTextFont.copyWith(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w400)),
                            //       Text(
                            //         "IDR 1.500 x ${widget.ticket.seats.length}",
                            //         style: whiteNumberFont.copyWith(
                            //             color: Colors.black,
                            //             fontSize: 16,
                            //             fontWeight: FontWeight.w400),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Total",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID',
                                            decimalDigits: 0,
                                            symbol: 'IDR ')
                                        .format(total),
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: defaultMargin),
                                child: const Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1,
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Your Wallet",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID',
                                            decimalDigits: 0,
                                            symbol: 'IDR ')
                                        .format(user.balance),
                                    style: whiteNumberFont.copyWith(
                                        color: user.balance >= total
                                            ? const Color(0xFF3E9D9D)
                                            : const Color(0xFFFF5C83),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 46,
                              margin:
                                  const EdgeInsets.only(top: 36, bottom: 50),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: user.balance >= total
                                      ? const Color(0xFF3E9D9D)
                                      : mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Text(
                                  user.balance >= total
                                      ? "Checkout Now"
                                      : "Top Up My Wallet",
                                  style: whiteTextFont.copyWith(fontSize: 16),
                                ),
                                onPressed: () {
                                  if (user.balance >= total) {
                                    FlutixTransaction transaction =
                                        FlutixTransaction(
                                            userID: user.id,
                                            title:
                                                widget.ticket.movieDetail.title,
                                            subtitle:
                                                widget.ticket.theater.name,
                                            time: DateTime.now(),
                                            amount: -total,
                                            picture: widget
                                                .ticket.movieDetail.posterPath);

                                    context.read<PageBloc>().add(
                                          GoToSuccessPage(
                                              widget.ticket
                                                  .copyWith(totalPrice: total),
                                              transaction),
                                        );
                                  } else {
                                    // #Uang tidak cukup
                                  }
                                },
                              ),
                            ),
                          ]);
                        },
                      ),
                    ],
                  )
                ],
              ),
              BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                UserApp? user = (userState as UserLoaded).user;
                return Positioned(
                  top: MediaQuery.of(context).size.height - 230,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff503e9d),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Your Bill",
                            style: whiteTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Price",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                "IDR 25.000 x ${widget.ticket.seats.length}",
                                style: whiteNumberFont.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Fee",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                "IDR 1.500 x ${widget.ticket.seats.length}",
                                style: whiteNumberFont.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: defaultMargin,
                                right: defaultMargin),
                            child: const Divider(
                              color: Color(0xFFE4E4E4),
                              thickness: 1,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Total",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: 'IDR ')
                                    .format(total),
                                style: whiteNumberFont.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      // width: MediaQuery.of(context).size.width -
                                      //     2 * defaultMargin -
                                      //      -
                                      //     20,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Cinema",
                                            style: whiteTextFont.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            NumberFormat.currency(
                                                    locale: 'id_ID',
                                                    decimalDigits: 0,
                                                    symbol: 'IDR ')
                                                .format(user.balance),
                                            style: whiteTextFont.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                  Container(
                                    width: 200,
                                    height: 46,
                                    margin: EdgeInsets.only(
                                        left: user.balance >= total
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                350
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                340,
                                        top: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: user.balance >= total
                                            ? Color.fromARGB(255, 255, 255, 255)
                                            : Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        user.balance >= total
                                            ? "Checkout Now"
                                            : "Top Up My Wallet",
                                        style: user.balance >= total
                                            ? blueTextFont.copyWith(
                                                fontSize: 16)
                                            : whiteTextFont.copyWith(
                                                fontSize: 16),
                                      ),
                                      onPressed: () {
                                        if (user.balance >= total) {
                                          FlutixTransaction transaction =
                                              FlutixTransaction(
                                                  userID: user.id,
                                                  title: widget
                                                      .ticket.movieDetail.title,
                                                  subtitle: widget
                                                      .ticket.theater.name,
                                                  time: DateTime.now(),
                                                  amount: -total,
                                                  picture: widget.ticket
                                                      .movieDetail.posterPath);

                                          context.read<PageBloc>().add(
                                                GoToSuccessPage(
                                                    widget.ticket.copyWith(
                                                        totalPrice: total),
                                                    transaction),
                                              );
                                        } else {
                                          // #Uang tidak cukup
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ));
  }
}
