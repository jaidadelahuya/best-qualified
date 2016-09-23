package com.bestqualified.servlets;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.bestqualified.bean.Book;
import com.bestqualified.util.SignedRequestsHelper;
import com.bestqualified.util.Util;
import com.google.appengine.api.urlfetch.FetchOptions;
import com.google.appengine.api.urlfetch.HTTPMethod;
import com.google.appengine.api.urlfetch.HTTPRequest;
import com.google.appengine.api.urlfetch.HTTPResponse;
import com.google.appengine.api.urlfetch.URLFetchService;
import com.google.appengine.api.urlfetch.URLFetchServiceFactory;

public class GetReadingList extends HttpServlet {

	//change this again
	private static final String ak = "AKIAJWQ3Z2P6ALOAAHDQ";
	private static final String ask = "bmn2HQ52rXR+e2B0orFFLpdqDvP2x04R6guJWQBd";
	private static final String ep = "webservices.amazon.com";

	private static final long serialVersionUID = -1477727040955965118L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String nodeId = req.getParameter("node-id");
		String sort = req.getParameter("sort");

		if (!Util.notNull(sort)) {
			Object o = null;
			synchronized (session) {
				o = session.getAttribute("sort");
			}
			if (o == null) {
				sort = "salesrank";
			} else {
				sort = (String) o;
			}
		}
		synchronized (session) {
			session.setAttribute("sort", sort);
		}

		if (!Util.notNull(nodeId)) {
			Object o = null;
			synchronized (session) {
				o = session.getAttribute("nodeId");
			}
			if (o == null) {
				nodeId = "2698";
			} else {
				nodeId = (String) o;
			}

		}
		synchronized (session) {
			session.setAttribute("nodeId", nodeId);
		}
		SignedRequestsHelper helper;

		try {
			helper = SignedRequestsHelper.getInstance(ep,
					ak, ask);
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}

		String requestUrl = null;

		Map<String, String> params = new HashMap<String, String>();

		params.put("Service", "AWSECommerceService");
		params.put("Operation", "ItemSearch");
		params.put("AWSAccessKeyId", "AKIAJWQ3Z2P6ALOAAHDQ");
		params.put("AssociateTag", "bqdemo-20");
		params.put("SearchIndex", "Books");
		params.put("ResponseGroup", "EditorialReview,Images,ItemAttributes");
		params.put("BrowseNode", nodeId);
		params.put("Sort", sort);

		requestUrl = helper.sign(params);
		URL url = new URL(requestUrl);
		FetchOptions options = FetchOptions.Builder.doNotFollowRedirects()
				.disallowTruncate();
		HTTPRequest request = new HTTPRequest(url, HTTPMethod.GET, options);
		URLFetchService urlfetch = URLFetchServiceFactory.getURLFetchService();
		try {
			HTTPResponse response = urlfetch.fetch(request);
			String r = new String(response.getContent(), "utf-8");

			String moreResultURL = null;

			List<Book> books = new ArrayList<>();
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			try {
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(new InputSource(
						new ByteArrayInputStream(r.getBytes("utf-8"))));
				doc.getDocumentElement().normalize();
				NodeList mrnl = doc
						.getElementsByTagName("MoreSearchResultsUrl");
				Node mrn = mrnl.item(0);
				moreResultURL = mrn.getTextContent();
				NodeList itemNodes = doc.getElementsByTagName("Item");

				for (int i = 0; i < itemNodes.getLength(); i++) {
					Book b = new Book();
					Node n = itemNodes.item(i);
					NodeList nl = n.getChildNodes();
					NodeList cln = null;
					for (int j = 0; j < nl.getLength(); j++) {
						Node nn = nl.item(j);
						String name = nn.getNodeName();
						switch (name) {
						case "ASIN":
							b.setId(nn.getTextContent());
							break;
						case "DetailPageURL":
							b.setDetailPageUrl(nn.getTextContent());
							break;
						case "LargeImage":
							cln = nn.getChildNodes();
							for (int k = 0; k < cln.getLength(); k++) {
								Node n1 = cln.item(k);
								if (n1.getNodeName().equalsIgnoreCase("URL")) {
									b.setImage(n1.getTextContent());
								}
							}
							break;
						case "ItemAttributes":
							cln = nn.getChildNodes();
							for (int k = 0; k < cln.getLength(); k++) {
								Node n1 = cln.item(k);
								if (n1.getNodeName().equalsIgnoreCase("Author")) {
									b.setAuthor(n1.getTextContent());
								} else if (n1.getNodeName().equalsIgnoreCase(
										"NumberOfPages")) {
									b.setNumberOfpages(n1.getTextContent());
								} else if (n1.getNodeName().equalsIgnoreCase(
										"PublicationDate")) {
									b.setPublicationDate(n1.getTextContent());
								} else if (n1.getNodeName().equalsIgnoreCase(
										"Title")) {
									b.setTitle(n1.getTextContent());
								}
							}
							break;

						case "ItemLinks":
							cln = nn.getChildNodes();
							for (int k = 0; k < cln.getLength(); k++) {
								Node itemList = cln.item(k);
								Node descNode = itemList.getFirstChild();
								String desc = descNode.getTextContent();
								if (desc.equalsIgnoreCase("Technical Details")) {
									b.setDetailPageUrl(itemList.getLastChild()
											.getTextContent());
								} else if (desc.equalsIgnoreCase("All Offers")) {
									b.setAllOffers(itemList.getLastChild()
											.getTextContent());
								}

							}
							break;
						case "EditorialReviews":
							cln = nn.getChildNodes();
							for (int k = 0; k < cln.getLength(); k++) {
								Node editorialReview = cln.item(k);
								NodeList snl = editorialReview.getChildNodes();
								String review = snl.item(1).getTextContent();
								b.setReview(review);
							}

						}
					}
					books.add(b);
				}

				// resp.getWriter().write(books.toString());
			} catch (ParserConfigurationException e) { // TODO Auto-generated
				e.printStackTrace();
			} catch (SAXException e) { // TODO
				e.printStackTrace();
			}

			synchronized (session) {
				session.setAttribute("moreReadingList", moreResultURL);
				session.setAttribute("readingList", books);
			}
			resp.sendRedirect(resp
					.encodeRedirectURL("/bq/coaching/tools/reading-list"));

		} catch (SocketTimeoutException ste) {
			resp.sendRedirect(resp
					.encodeRedirectURL("/bq/coaching/tools/get-reading-list"));
		} catch (Exception e) {
			resp.getWriter().write(
					"An error has occured. Check your internet connection");
		}

	}

}
